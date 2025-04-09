import React, { useState, useEffect } from 'react';
import { Box, Container, Typography, CircularProgress, Grid } from '@mui/material';
import MigrationMap from '../components/MigrationMap';
import CityDetails from '../components/CityDetails';
import RouteDetails from '../components/RouteDetails';
import axios from 'axios';

const Home = () => {
    const [migrations, setMigrations] = useState([]);
    const [selectedCity, setSelectedCity] = useState(null);
    const [selectedRoute, setSelectedRoute] = useState(null);
    const [cityMigrations, setCityMigrations] = useState([]);
    const [routeMigrations, setRouteMigrations] = useState([]);
    const [loading, setLoading] = useState(true);
    const [routeLoading, setRouteLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchMigrations();
    }, []);

    useEffect(() => {
        if (selectedCity) {
            fetchCityMigrations(selectedCity.name);
        }
    }, [selectedCity]);

    useEffect(() => {
        if (selectedRoute) {
            fetchRouteMigrations(selectedRoute);
        }
    }, [selectedRoute]);

    const fetchMigrations = async () => {
        try {
            const response = await axios.get('http://localhost:8000/migrations/routes');
            setMigrations(response.data);
            setLoading(false);
        } catch (err) {
            setError('Помилка завантаження даних');
            setLoading(false);
        }
    };

    const fetchCityMigrations = async (cityName) => {
        try {
            setLoading(true);
            const [statsResponse, connectionsResponse] = await Promise.all([
                axios.get(`http://localhost:8000/cities/${cityName}/stats`),
                axios.get(`http://localhost:8000/cities/${cityName}/connections`)
            ]);
            
            setSelectedCity(prev => ({
                ...prev,
                ...statsResponse.data
            }));
            
            setCityMigrations(connectionsResponse.data);
            setLoading(false);
        } catch (err) {
            setError('Помилка завантаження даних міста');
            setLoading(false);
        }
    };

    const fetchRouteMigrations = async (route) => {
        try {
            setRouteLoading(true);
            const response = await axios.get(`http://localhost:8000/migrations/route/${route.id}`);
            setRouteMigrations(response.data);
            setRouteLoading(false);
        } catch (err) {
            setError('Помилка завантаження даних маршруту');
            setRouteLoading(false);
        }
    };

    const handleCityClick = (city) => {
        setSelectedCity(city);
        setSelectedRoute(null);
    };

    const handleRouteClick = (migration) => {
        setSelectedRoute(migration);
    };

    if (loading && !selectedCity) {
        return (
            <Box display="flex" justifyContent="center" alignItems="center" minHeight="100vh">
                <CircularProgress />
            </Box>
        );
    }

    if (error) {
        return (
            <Container>
                <Typography color="error" variant="h6">
                    {error}
                </Typography>
            </Container>
        );
    }

    return (
        <Box sx={{ display: 'flex', flexDirection: 'column', height: '100vh' }}>
            <Box sx={{ flexGrow: 1, display: 'flex' }}>
                <Box sx={{ flexGrow: 1 }}>
                    <MigrationMap
                        migrations={migrations}
                        selectedCity={selectedCity}
                        selectedRoute={selectedRoute}
                        onCityClick={handleCityClick}
                        onRouteClick={handleRouteClick}
                    />
                </Box>
                <Box sx={{ width: 400, overflow: 'auto' }}>
                    {selectedRoute ? (
                        <RouteDetails
                            route={selectedRoute}
                            loading={routeLoading}
                        />
                    ) : (
                        <CityDetails
                            city={selectedCity}
                            migrations={cityMigrations}
                            loading={loading}
                        />
                    )}
                </Box>
            </Box>
        </Box>
    );
};

export default Home; 