import tensorflow as tf
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder
from typing import Dict, List, Tuple
import joblib
import os

class MigrationPatternModel:
    def __init__(self):
        self.model = None
        self.scaler = StandardScaler()
        self.label_encoder = LabelEncoder()
        self.feature_columns = [
            'age', 'distance_km', 'from_population', 'to_population',
            'from_lat', 'from_lng', 'to_lat', 'to_lng'
        ]
        self.target_column = 'reason'
        
    def build_model(self):
        """Створення архітектури нейронної мережі"""
        # Установка значения по умолчанию для количества классов, если label_encoder еще не обучен
        num_classes = len(self.label_encoder.classes_) if hasattr(self.label_encoder, 'classes_') else 5
        
        self.model = tf.keras.Sequential([
            tf.keras.layers.Dense(64, activation='relu', input_shape=(len(self.feature_columns),)),
            tf.keras.layers.Dropout(0.3),
            tf.keras.layers.Dense(32, activation='relu'),
            tf.keras.layers.Dropout(0.3),
            tf.keras.layers.Dense(16, activation='relu'),
            tf.keras.layers.Dense(num_classes, activation='softmax')
        ])
        
        self.model.compile(
            optimizer='adam',
            loss='sparse_categorical_crossentropy',
            metrics=['accuracy']
        )
        
    def prepare_data(self, data: pd.DataFrame) -> Tuple[np.ndarray, np.ndarray]:
        """Підготовка даних для навчання"""
        # Додавання координат та населення міст
        data['from_lat'] = data['from_city'].apply(lambda x: x['lat'])
        data['from_lng'] = data['from_city'].apply(lambda x: x['lng'])
        data['to_lat'] = data['to_city'].apply(lambda x: x['lat'])
        data['to_lng'] = data['to_city'].apply(lambda x: x['lng'])
        data['from_population'] = data['from_city'].apply(lambda x: x['population'])
        data['to_population'] = data['to_city'].apply(lambda x: x['population'])
        
        # Кодування причин міграції
        y = self.label_encoder.fit_transform(data[self.target_column])
        
        # Нормалізація числових ознак
        X = self.scaler.fit_transform(data[self.feature_columns])
        
        return X, y
    
    def train(self, data: pd.DataFrame, epochs: int = 50, batch_size: int = 32):
        """Навчання моделі"""
        if self.model is None:
            self.build_model()
            
        X, y = self.prepare_data(data)
        
        # Розділення на тренувальну та валідаційну вибірки
        split_idx = int(len(X) * 0.8)
        X_train, X_val = X[:split_idx], X[split_idx:]
        y_train, y_val = y[:split_idx], y[split_idx:]
        
        # Навчання моделі
        history = self.model.fit(
            X_train, y_train,
            epochs=epochs,
            batch_size=batch_size,
            validation_data=(X_val, y_val),
            callbacks=[
                tf.keras.callbacks.EarlyStopping(
                    monitor='val_loss',
                    patience=5,
                    restore_best_weights=True
                )
            ]
        )
        
        return history
    
    def predict(self, data: pd.DataFrame) -> List[Dict[str, float]]:
        """Прогнозування причин міграції"""
        if self.model is None:
            raise ValueError("Модель не навчена")
            
        X, _ = self.prepare_data(data)
        predictions = self.model.predict(X)
        
        results = []
        for pred in predictions:
            result = {
                self.label_encoder.inverse_transform([i])[0]: float(prob)
                for i, prob in enumerate(pred)
            }
            results.append(result)
            
        return results
    
    def save_model(self, model_dir: str = "models"):
        """Збереження моделі та препроцесорів"""
        os.makedirs(model_dir, exist_ok=True)
        self.model.save_weights(f"{model_dir}/migration_model_weights.h5")
        joblib.dump(self.scaler, f"{model_dir}/scaler.pkl")
        joblib.dump(self.label_encoder, f"{model_dir}/label_encoder.pkl")
    
    def load_model(self, model_dir: str = "models"):
        """Завантаження моделі та препроцесорів"""
        try:
            if self.model is None:
                self.build_model()
            self.model.load_weights(f"{model_dir}/migration_model_weights.h5")
        except:
            print("Не вдалося завантажити модель. Створюємо нову.")
            self.build_model()
        try:
            self.scaler = joblib.load(f"{model_dir}/scaler.pkl")
            self.label_encoder = joblib.load(f"{model_dir}/label_encoder.pkl")
        except:
            print("Не вдалося завантажити препроцесори. Використовуємо нові.") 