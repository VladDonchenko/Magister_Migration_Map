import React, { useState, useEffect } from 'react';
import { Box, Typography, Paper, Grid, CircularProgress, Alert } from '@mui/material';
import Map from '../components/Map';
import CityDetails from '../components/CityDetails';
import { City, MigrationFlow } from '../types';
import migrationApi from '../utils/api/index';

const HomePage: React.FC = () => {
  const [cities, setCities] = useState<City[]>([]);
  const [migrations, setMigrations] = useState<MigrationFlow[]>([]);
  const [selectedCity, setSelectedCity] = useState<City | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        setError(null);
        
        const response = await migrationApi.getMapData();
        console.log('API Response:', response);
        
        if (!response || !response.nodes || !response.edges) {
          throw new Error('Некоректні дані від сервера');
        }

        // Перетворюємо nodes в cities
        const citiesData = response.nodes.map((node: any) => ({
          name: node.name,
          latitude: node.lat,
          longitude: node.lon,
          incomingMigrations: 0, // Буде розраховано пізніше
          outgoingMigrations: 0  // Буде розраховано пізніше
        }));

        // Перетворюємо edges в migrations
        const migrationsData = response.edges.map((edge: any) => ({
          fromCity: citiesData.find((city: City) => city.name === edge.source),
          toCity: citiesData.find((city: City) => city.name === edge.target),
          count: edge.weight || 1
        }));

        // Розраховуємо вхідні та вихідні міграції для кожного міста
        citiesData.forEach((city: City) => {
          city.incomingMigrations = migrationsData.filter(
            (m: MigrationFlow) => m.toCity?.name === city.name
          ).length;
          city.outgoingMigrations = migrationsData.filter(
            (m: MigrationFlow) => m.fromCity?.name === city.name
          ).length;
        });
        
        setCities(citiesData);
        setMigrations(migrationsData);
      } catch (error) {
        console.error('Error fetching migration data:', error);
        setError(error instanceof Error ? error.message : 'Unknown error');
        setCities([]);
        setMigrations([]);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  const handleCityClick = (city: City) => {
    console.log('Selected city:', city);
    setSelectedCity(city);
  };

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="400px">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box p={3}>
        <Alert severity="error">
          {error}
        </Alert>
      </Box>
    );
  }

  return (
    <Box sx={{ 
      height: 'calc(100vh - 64px)', // Віднімаємо висоту навігації
      position: 'relative',
      overflow: 'hidden'
    }}>
      <Grid container spacing={2} sx={{ height: '100%' }}>
        <Grid item xs={12} sx={{ 
          height: '100%',
          position: 'relative',
          zIndex: 1
        }}>
          <Map
            cities={cities}
            migrations={migrations}
            onCityClick={handleCityClick}
          />
        </Grid>
      </Grid>
      
      {selectedCity && (
        <Box
          sx={{
            position: 'fixed',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            zIndex: 9999,
            backgroundColor: 'white',
            padding: 3,
            borderRadius: 2,
            boxShadow: '0 0 20px rgba(0,0,0,0.2)',
            width: '90%',
            maxWidth: '400px',
            maxHeight: '80vh',
            overflow: 'auto'
          }}
        >
          <CityDetails city={selectedCity} />
        </Box>
      )}
    </Box>
  );
};

export default HomePage; 