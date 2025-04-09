import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, Polyline, Marker, Popup, useMap } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';
import L from 'leaflet';
import { Box, Typography, Paper, Slider, FormControl, InputLabel, Select, MenuItem } from '@mui/material';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFns';
import { format } from 'date-fns';
import { uk } from 'date-fns/locale';

// Виправлення для іконок маркерів
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
    iconUrl: require('leaflet/dist/images/marker-icon.png'),
    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

// Компонент для оновлення центру карти
function ChangeView({ center, zoom }) {
    const map = useMap();
    useEffect(() => {
        map.setView(center, zoom);
    }, [center, zoom, map]);
    return null;
}

const MigrationMap = ({ migrations, selectedCity, selectedRoute, onCityClick, onRouteClick }) => {
    const [center, setCenter] = useState([48.3794, 31.1656]); // Центр України
    const [zoom, setZoom] = useState(6);
    const [dateRange, setDateRange] = useState([null, null]);
    const [selectedReason, setSelectedReason] = useState('all');
    const [opacity, setOpacity] = useState(0.7);

    const reasons = ['all', ...new Set(migrations.map(m => m.reason))];

    useEffect(() => {
        if (selectedCity) {
            setCenter([selectedCity.lat, selectedCity.lng]);
            setZoom(8);
        }
    }, [selectedCity]);

    const filteredMigrations = migrations.filter(migration => {
        const date = new Date(migration.migration_date);
        const inDateRange = (!dateRange[0] || date >= dateRange[0]) && 
                           (!dateRange[1] || date <= dateRange[1]);
        const matchesReason = selectedReason === 'all' || migration.reason === selectedReason;
        return inDateRange && matchesReason;
    });

    return (
        <Box sx={{ display: 'flex', height: '100vh' }}>
            <Paper sx={{ width: 300, p: 2, overflow: 'auto' }}>
                <Typography variant="h6" gutterBottom>
                    Фільтри
                </Typography>
                
                <LocalizationProvider dateAdapter={AdapterDateFns} adapterLocale={uk}>
                    <DatePicker
                        label="Початкова дата"
                        value={dateRange[0]}
                        onChange={(newValue) => setDateRange([newValue, dateRange[1]])}
                        sx={{ mb: 2, width: '100%' }}
                    />
                    <DatePicker
                        label="Кінцева дата"
                        value={dateRange[1]}
                        onChange={(newValue) => setDateRange([dateRange[0], newValue])}
                        sx={{ mb: 2, width: '100%' }}
                    />
                </LocalizationProvider>

                <FormControl fullWidth sx={{ mb: 2 }}>
                    <InputLabel>Причина міграції</InputLabel>
                    <Select
                        value={selectedReason}
                        onChange={(e) => setSelectedReason(e.target.value)}
                        label="Причина міграції"
                    >
                        {reasons.map(reason => (
                            <MenuItem key={reason} value={reason}>
                                {reason === 'all' ? 'Всі причини' : reason}
                            </MenuItem>
                        ))}
                    </Select>
                </FormControl>

                <Typography gutterBottom>
                    Прозорість маршрутів
                </Typography>
                <Slider
                    value={opacity}
                    onChange={(_, newValue) => setOpacity(newValue)}
                    min={0}
                    max={1}
                    step={0.1}
                    sx={{ mb: 2 }}
                />

                <Typography variant="subtitle1" gutterBottom>
                    Статистика
                </Typography>
                <Typography variant="body2">
                    Всього міграцій: {filteredMigrations.length}
                </Typography>
                <Typography variant="body2">
                    Унікальних маршрутів: {new Set(filteredMigrations.map(m => 
                        `${m.from_city.name}-${m.to_city.name}`)).size}
                </Typography>
            </Paper>

            <Box sx={{ flexGrow: 1 }}>
                <MapContainer
                    center={center}
                    zoom={zoom}
                    style={{ height: '100%', width: '100%' }}
                >
                    <ChangeView center={center} zoom={zoom} />
                    <TileLayer
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    />
                    
                    {filteredMigrations.map((migration) => {
                        const isSelected = selectedRoute && selectedRoute.id === migration.id;
                        return (
                            <React.Fragment key={migration.id}>
                                <Polyline
                                    positions={[
                                        [migration.from_city.lat, migration.from_city.lng],
                                        [migration.to_city.lat, migration.to_city.lng]
                                    ]}
                                    color={isSelected ? "#ff0000" : "#3388ff"}
                                    weight={isSelected ? 5 : 3}
                                    opacity={isSelected ? 1 : opacity}
                                    onClick={() => onRouteClick(migration)}
                                >
                                    <Popup>
                                        <div>
                                            <h3>Маршрут міграції</h3>
                                            <p>Від: {migration.from_city.name}</p>
                                            <p>До: {migration.to_city.name}</p>
                                            <p>Дата: {format(new Date(migration.migration_date), 'dd MMMM yyyy', { locale: uk })}</p>
                                            <p>Причина: {migration.reason}</p>
                                            <p>Відстань: {migration.distance_km} км</p>
                                        </div>
                                    </Popup>
                                </Polyline>

                                <Marker
                                    position={[migration.from_city.lat, migration.from_city.lng]}
                                    onClick={() => onCityClick(migration.from_city)}
                                >
                                    <Popup>
                                        <div>
                                            <h3>{migration.from_city.name}</h3>
                                            <p>Населення: {migration.from_city.population}</p>
                                            <p>Еміграції: {migration.from_city.emigrations}</p>
                                            <p>Іміграції: {migration.from_city.immigrations}</p>
                                        </div>
                                    </Popup>
                                </Marker>
                                <Marker
                                    position={[migration.to_city.lat, migration.to_city.lng]}
                                    onClick={() => onCityClick(migration.to_city)}
                                >
                                    <Popup>
                                        <div>
                                            <h3>{migration.to_city.name}</h3>
                                            <p>Населення: {migration.to_city.population}</p>
                                            <p>Еміграції: {migration.to_city.emigrations}</p>
                                            <p>Іміграції: {migration.to_city.immigrations}</p>
                                        </div>
                                    </Popup>
                                </Marker>
                            </React.Fragment>
                        );
                    })}
                </MapContainer>
            </Box>
        </Box>
    );
};

export default MigrationMap; 