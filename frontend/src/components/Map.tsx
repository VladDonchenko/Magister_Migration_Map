import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, CircleMarker, Polyline, Popup } from 'react-leaflet';
import { LatLngTuple } from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { City, MigrationFlow } from '../types';

interface MapProps {
    cities: City[];
    migrationFlows: MigrationFlow[];
    selectedCity?: string;
    onCitySelect: (cityName: string) => void;
}

const Map: React.FC<MapProps> = ({ cities, migrationFlows, selectedCity, onCitySelect }) => {
    const [center, setCenter] = useState<LatLngTuple>([48.3794, 31.1656]); // Центр Украины
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        if (selectedCity) {
            const city = cities.find(c => c.name === selectedCity);
            if (city) {
                setCenter([city.latitude, city.longitude]);
            } else {
                setError('Місто не знайдено');
            }
        }
    }, [selectedCity, cities]);

    if (error) {
        return (
            <div className="error">
                <h2>Помилка</h2>
                <p>{error}</p>
            </div>
        );
    }

    return (
        <MapContainer
            center={center}
            zoom={6}
            style={{ height: '600px', width: '100%' }}
        >
            <TileLayer
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            />
            
            {cities.map(city => (
                <CircleMarker
                    key={city.name}
                    center={[city.latitude, city.longitude] as LatLngTuple}
                    radius={8}
                    fillColor={city.name === selectedCity ? '#e74c3c' : '#3498db'}
                    color="#fff"
                    weight={2}
                    eventHandlers={{
                        click: () => onCitySelect(city.name)
                    }}
                >
                    <Popup>
                        <div>
                            <h3>{city.name}</h3>
                            <p>Координати: {city.latitude.toFixed(4)}, {city.longitude.toFixed(4)}</p>
                        </div>
                    </Popup>
                </CircleMarker>
            ))}
            {migrationFlows.map((flow, index) => {
                const fromCity = cities.find(c => c.name === flow.fromCity);
                const toCity = cities.find(c => c.name === flow.toCity);
                
                if (!fromCity || !toCity) return null;

                return (
                    <Polyline
                        key={index}
                        positions={[
                            [fromCity.latitude, fromCity.longitude],
                            [toCity.latitude, toCity.longitude]
                        ]}
                        color="#2ecc71"
                        weight={Math.min(flow.count / 100, 5)}
                        opacity={0.6}
                    >
                        <Popup>
                            <div>
                                <h3>Міграційний потік</h3>
                                <p>Від: {flow.fromCity}</p>
                                <p>До: {flow.toCity}</p>
                                <p>Кількість: {flow.count}</p>
                                <p>Відстань: {flow.distance.toFixed(1)} км</p>
                            </div>
                        </Popup>
                    </Polyline>
                );
            })}
        </MapContainer>
    );
};

export default Map; 