import tensorflow as tf
import numpy as np
from sklearn.preprocessing import StandardScaler
import joblib
from tensorflow.keras.layers import LSTM, Dense, Dropout, BatchNormalization
from tensorflow.keras.models import Sequential

class MigrationModel:
    def __init__(self, model_path=None, scaler_path=None):
        self.model = self.load_model(model_path) if model_path else self.build_model()
        self.scaler = joblib.load(scaler_path) if scaler_path else StandardScaler()

    def load_model(self, model_path):
        try:
            return tf.keras.models.load_model(model_path)
        except Exception as e:
            print(f"Error loading model: {str(e)}")
            raise

    def build_model(self):
        model = Sequential([
            # Вхідний шар для часових рядів
            LSTM(128, input_shape=(10, 4), return_sequences=True),
            BatchNormalization(),
            Dropout(0.3),
            
            # Додаткові LSTM шари для кращого розуміння часових залежностей
            LSTM(64, return_sequences=False),
            BatchNormalization(),
            Dropout(0.3),
            
            # Повністю з'єднані шари для обробки особливостей
            Dense(64, activation='relu'),
            BatchNormalization(),
            Dropout(0.2),
            
            Dense(32, activation='relu'),
            BatchNormalization(),
            
            # Вихідний шар
            Dense(1, activation='sigmoid')
        ])
        
        model.compile(
            optimizer='adam',
            loss='binary_crossentropy',
            metrics=['accuracy', tf.keras.metrics.AUC(), tf.keras.metrics.Precision(), tf.keras.metrics.Recall()]
        )
        return model

    def prepare_sequence_data(self, features, sequence_length=10):
        """Підготовка даних у форматі послідовностей для LSTM"""
        sequences = []
        for i in range(len(features) - sequence_length + 1):
            sequences.append(features[i:i + sequence_length])
        return np.array(sequences)

    def predict(self, features):
        try:
            scaled_features = self.scaler.transform(features)
            sequences = self.prepare_sequence_data(scaled_features)
            predictions = self.model.predict(sequences)
            return predictions.flatten()
        except Exception as e:
            print(f"Error during prediction: {str(e)}")
            raise

    def train(self, X_train, y_train, validation_split=0.2, epochs=50, batch_size=32):
        """Метод для навчання моделі"""
        try:
            scaled_X = self.scaler.fit_transform(X_train)
            sequences = self.prepare_sequence_data(scaled_X)
            
            history = self.model.fit(
                sequences,
                y_train[9:],  # Зміщуємо мітки, оскільки ми використовуємо послідовності
                validation_split=validation_split,
                epochs=epochs,
                batch_size=batch_size,
                callbacks=[
                    tf.keras.callbacks.EarlyStopping(
                        monitor='val_loss',
                        patience=5,
                        restore_best_weights=True
                    )
                ]
            )
            return history 