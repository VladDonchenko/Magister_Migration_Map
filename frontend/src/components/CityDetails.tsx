import React, { useEffect, useState } from 'react';
import { Box, Typography, CircularProgress, Alert, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import { City, CityStats } from '../types';
import migrationApi from '../utils/api/index';

interface CityDetailsProps {
  city: City;
}

const CityDetails: React.FC<CityDetailsProps> = ({ city }) => {
  const navigate = useNavigate();
  const [stats, setStats] = useState<CityStats | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchCityStats = async () => {
      if (!city) return;
      
      try {
        setLoading(true);
        setError(null);
        const cityStats = await migrationApi.getCityStats(city.name);
        if (!cityStats) {
          throw new Error('Не вдалося отримати статистику міста');
        }
        setStats(cityStats);
      } catch (error: any) {
        console.error('Error fetching city stats:', error);
        if (error.response?.status === 404) {
          setError(`Місто "${city.name}" не знайдено`);
        } else {
          setError(error.response?.data?.detail || 'Помилка при отриманні статистики міста');
        }
      } finally {
        setLoading(false);
      }
    };

    fetchCityStats();
  }, [city]);

  if (!city) return null;

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" height="100%">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box p={3}>
        <Alert severity="error">{error}</Alert>
      </Box>
    );
  }

  return (
    <Box sx={{ height: '100%', overflow: 'auto' }}>
      <Typography variant="h6" gutterBottom>
        {city.name}
      </Typography>
      
      <Box mb={3}>
        <Typography variant="subtitle1" gutterBottom>
          Географічні дані
        </Typography>
        <Typography>
          <strong>Широта:</strong> {city.latitude.toFixed(4)}
        </Typography>
        <Typography>
          <strong>Довгота:</strong> {city.longitude.toFixed(4)}
        </Typography>
      </Box>

      {stats && (
        <Box>
          <Typography variant="subtitle1" gutterBottom>
            Статистика міграції
          </Typography>
          <Typography>
            <strong>Виїжджають:</strong> {stats.outgoingCount}
          </Typography>
          <Typography>
            <strong>Прибувають:</strong> {stats.incomingCount}
          </Typography>
          <Typography>
            <strong>Середня відстань:</strong> {stats.averageDistance.toFixed(2)} км
          </Typography>
          <Button 
            variant="contained" 
            color="primary" 
            onClick={() => navigate(`/city/${city.name}`)}
            style={{ marginTop: '16px' }}
          >
            Детальніше
          </Button>
        </Box>
      )}
    </Box>
  );
};

export default CityDetails; 