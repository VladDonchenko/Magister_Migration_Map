import React, { useState, useEffect } from 'react';
import { Box, Container, Typography, Paper } from '@mui/material';
import MigrationMap from '../components/MigrationMap';
import CityDetails from '../components/CityDetails';

const Home = () => {
    const [migrations, setMigrations] = useState([]);
    const [cities, setCities] = useState([]);
    const [selectedCity, setSelectedCity] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const [citiesResponse, migrationsResponse] = await Promise.all([
                    fetch('/api/v1/cities'),
                    fetch('/api/v1/migration/flows')
                ]);

                if (!citiesResponse.ok || !migrationsResponse.ok) {
                    throw new Error('Помилка при завантаженні даних');
                }

                const [citiesData, migrationsData] = await Promise.all([
                    citiesResponse.json(),
                    migrationsResponse.json()
                ]);

                setCities(citiesData);
                setMigrations(migrationsData);
                setLoading(false);
            } catch (err) {
                console.error('Помилка при завантаженні даних:', err);
                setError(err.message);
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    const handleCityClick = (city) => {
        setSelectedCity(city);
    };

    if (loading) {
        return <Typography>Завантаження...</Typography>;
    }

    if (error) {
        return <Typography color="error">{error}</Typography>;
    }

    return (
        <Container>
            <Box sx={{ my: 4 }}>
                <Paper sx={{ p: 2, mb: 2 }}>
                    <Typography variant="h4" gutterBottom>
                        Карта міграції
                    </Typography>
                    <MigrationMap 
                        cities={cities}
                        migrations={migrations} 
                        onCityClick={handleCityClick} 
                    />
                </Paper>
                <CityDetails city={selectedCity} />
            </Box>
        </Container>
    );
};

export default Home; 