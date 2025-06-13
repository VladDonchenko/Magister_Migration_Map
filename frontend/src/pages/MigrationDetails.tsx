import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Container, Typography, Paper, CircularProgress, Alert } from '@mui/material';

interface CityStats {
  city: string;
  outgoing_migrations: number;
  incoming_migrations: number;
  avg_distance: number;
  reasons: string[];
}

const MigrationDetails: React.FC = () => {
  const { cityName } = useParams<{ cityName: string }>();
  const [stats, setStats] = useState<CityStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchCityStats = async () => {
      try {
        setLoading(true);
        const response = await fetch(`/api/v1/cities/${encodeURIComponent(cityName || '')}/stats`);
        
        if (!response.ok) {
          throw new Error('Помилка при завантаженні статистики міста');
        }

        const data = await response.json();
        setStats(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Невідома помилка');
      } finally {
        setLoading(false);
      }
    };

    if (cityName) {
      fetchCityStats();
    }
  }, [cityName]);

  if (loading) {
    return (
      <Container sx={{ display: 'flex', justifyContent: 'center', mt: 4 }}>
        <CircularProgress />
      </Container>
    );
  }

  if (error) {
    return (
      <Container sx={{ mt: 4 }}>
        <Alert severity="error">{error}</Alert>
      </Container>
    );
  }

  if (!stats) {
    return null;
  }

  return (
    <Container sx={{ mt: 4 }}>
      <Paper sx={{ p: 3 }}>
        <Typography variant="h4" gutterBottom>
          Статистика міграції: {stats.city}
        </Typography>
        
        <Typography variant="h6" gutterBottom>
          Вихідні міграції: {stats.outgoing_migrations}
        </Typography>
        
        <Typography variant="h6" gutterBottom>
          Вхідні міграції: {stats.incoming_migrations}
        </Typography>
        
        <Typography variant="h6" gutterBottom>
          Середня відстань: {stats.avg_distance?.toFixed(2) || 'Н/Д'} км
        </Typography>
        
        {stats.reasons && stats.reasons.length > 0 && (
          <>
            <Typography variant="h6" gutterBottom>
              Причини міграції:
            </Typography>
            <ul>
              {stats.reasons.map((reason, index) => (
                <li key={index}>
                  <Typography>{reason}</Typography>
                </li>
              ))}
            </ul>
          </>
        )}
      </Paper>
    </Container>
  );
};

export default MigrationDetails; 