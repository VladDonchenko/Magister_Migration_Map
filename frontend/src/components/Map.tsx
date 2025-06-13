import React from 'react';
import { MapContainer, TileLayer, Marker, Popup, Polyline } from 'react-leaflet';
import { LatLngTuple, Icon } from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { City, MigrationFlow } from '../types/index';
import { Box } from '@mui/material';

interface MapProps {
    cities: City[];
    migrations: MigrationFlow[];
    onCityClick: (city: City) => void;
}

const Map: React.FC<MapProps> = ({ cities, migrations, onCityClick }) => {
    const defaultCenter: LatLngTuple = [48.3794, 31.1656]; // Центр України

    const getCityIcon = (city: City) => {
        const balance = city.incomingMigrations - city.outgoingMigrations;
        let color = '#FFA500'; // оранжевий для нейтрального балансу
        
        if (balance > 0) {
            color = '#4CAF50'; // зелений для позитивного балансу
        } else if (balance < 0) {
            color = '#F44336'; // червоний для негативного балансу
        }

        const svgString = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="32" height="32">
            <circle cx="50" cy="50" r="40" fill="${color}"/>
        </svg>`;

        const encodedSvg = encodeURIComponent(svgString);

        return new Icon({
            iconUrl: `data:image/svg+xml,${encodedSvg}`,
            iconSize: [32, 32],
            iconAnchor: [16, 16],
            popupAnchor: [0, -16],
        });
    };

    return (
        <Box sx={{ 
            position: 'relative',
            width: '100%',
            height: '100%',
            zIndex: 1,
            '& .leaflet-container': {
                width: '100%',
                height: '100%',
                zIndex: 1
            }
        }}>
            <MapContainer
                center={defaultCenter}
                zoom={6}
                style={{ width: '100%', height: '100%' }}
                zoomControl={false}
            >
                <TileLayer
                    url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                />
                {cities.map((city, index) => (
                    <Marker
                        key={index}
                        position={[city.latitude, city.longitude]}
                        icon={getCityIcon(city)}
                        eventHandlers={{
                            click: () => onCityClick(city)
                        }}
                    >
                        <Popup>
                            <strong>{city.name}</strong>
                            <br />
                            Населення: {city.population?.toLocaleString() || 'Невідомо'}
                            <br />
                            Прибуття: {city.incomingMigrations}
                            <br />
                            Виїзди: {city.outgoingMigrations}
                        </Popup>
                    </Marker>
                ))}
                {migrations.map((migration, index) => (
                    <Polyline
                        key={index}
                        positions={[
                            [migration.fromCity.latitude, migration.fromCity.longitude],
                            [migration.toCity.latitude, migration.toCity.longitude]
                        ]}
                        color="red"
                        weight={2}
                        opacity={0.6}
                    >
                        <Popup>
                            <strong>Міграційний потік</strong>
                            <br />
                            {`${migration.fromCity.name} → ${migration.toCity.name}`}
                            <br />
                            Кількість мігрантів: {migration.count}
                        </Popup>
                    </Polyline>
                ))}
            </MapContainer>
        </Box>
    );
};

export default Map; 