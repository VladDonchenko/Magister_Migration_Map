import React, { useEffect, useState } from 'react';
import { Container, Box, Typography, CircularProgress } from '@mui/material';
import Stats from './components/Stats';
import CityList from './components/CityList';
import MigrationMap from './components/MigrationMap';

interface City {
  name: string;
  region: string;
  latitude: number;
  longitude: number;
  population: number;
}

interface MigrationStats {
  total_migrations: number;
  total_cities: number;
  total_people: number;
  avg_distance: number;
  most_common_reasons: string[];
  monthly_stats: Array<{
    month: string;
    count: number;
  }>;
}

function App() {
  const [cities, setCities] = useState<City[]>([]);
  const [stats, setStats] = useState<MigrationStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        setError(null);

        // Загрузка списка городов
        const citiesResponse = await fetch('http://localhost:8000/api/v1/cities');
        if (!citiesResponse.ok) {
          throw new Error('Помилка завантаження списку міст');
        }
        const citiesData = await citiesResponse.json();
        setCities(citiesData);

        // Загрузка статистики миграции
        const statsResponse = await fetch('http://localhost:8000/api/v1/migration/stats');
        if (!statsResponse.ok) {
          throw new Error('Помилка завантаження статистики');
        }
        const statsData = await statsResponse.json();
        setStats(statsData);

      } catch (err) {
        setError(err instanceof Error ? err.message : 'Помилка завантаження даних');
        console.error('Помилка:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ p: 3 }}>
        <Typography color="error">{error}</Typography>
      </Box>
    );
  }

  return (
    <Container maxWidth="lg">
      <Box sx={{ my: 4 }}>
        <Typography variant="h3" component="h1" gutterBottom align="center">
          Карта міграції України
        </Typography>
        
        {stats && <Stats stats={stats} />}
        
        <Box sx={{ mt: 4 }}>
          <CityList cities={cities} />
        </Box>
        
        <Box sx={{ mt: 4 }}>
          <MigrationMap cities={cities} />
        </Box>
      </Box>
    </Container>
  );
}

export default App; 