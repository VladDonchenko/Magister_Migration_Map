import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { Grid, Paper, Typography, CircularProgress } from '@mui/material';
import CityStats from '../components/CityStats';
import CityMigrationFlows from '../components/CityMigrationFlows';

interface CityDetails {
  name: string;
  latitude: number;
  longitude: number;
  stats: {
    incoming_migrations: number;
    outgoing_migrations: number;
  };
}

const CityDetailsPage: React.FC = () => {
  const { cityName } = useParams<{ cityName: string }>();
  const [cityDetails, setCityDetails] = useState<CityDetails | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCityDetails = async () => {
      try {
        const response = await fetch(`/api/v1/cities/${cityName}`);
        if (!response.ok) {
          throw new Error('Failed to fetch city details');
        }
        const data = await response.json();
        setCityDetails(data);
      } catch (error) {
        console.error('Error fetching city details:', error);
      } finally {
        setLoading(false);
      }
    };

    if (cityName) {
      fetchCityDetails();
    }
  }, [cityName]);

  if (loading) {
    return (
      <Grid container justifyContent="center" alignItems="center" style={{ minHeight: '200px' }}>
        <CircularProgress />
      </Grid>
    );
  }

  if (!cityDetails) {
    return (
      <Typography variant="h6" color="error">
        Город не найден
      </Typography>
    );
  }

  return (
    <Grid container spacing={3}>
      <Grid item xs={12}>
        <Paper sx={{ p: 2 }}>
          <Typography variant="h5" component="h2" gutterBottom>
            {cityDetails.name}
          </Typography>
          <CityStats cityName={cityName!} />
        </Paper>
      </Grid>
      <Grid item xs={12}>
        <Paper sx={{ p: 2 }}>
          <Typography variant="h5" component="h2" gutterBottom>
            Миграционные потоки
          </Typography>
          <CityMigrationFlows cityName={cityName!} />
        </Paper>
      </Grid>
    </Grid>
  );
};

export default CityDetailsPage; 