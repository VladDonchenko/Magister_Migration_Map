import React, { useState, useEffect } from 'react';
import { Card, CardContent, Typography, Grid, CircularProgress } from '@mui/material';
import migrationApi from '../utils/api/index';

interface CityStatsProps {
  cityName: string;
}

interface CityStatsData {
  outgoingCount: number;
  incomingCount: number;
  averageDistance: number;
}

const CityStats: React.FC<CityStatsProps> = ({ cityName }) => {
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState<CityStatsData>({
    outgoingCount: 0,
    incomingCount: 0,
    averageDistance: 0
  });

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const response = await migrationApi.getCityStats(cityName);
        setStats(response);
      } catch (error) {
        console.error('Error fetching city stats:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchStats();
  }, [cityName]);

  if (loading) {
    return (
      <Card>
        <CardContent>
          <Grid container justifyContent="center">
            <CircularProgress />
          </Grid>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardContent>
        <Grid container spacing={2}>
          <Grid item xs={12}>
            <Typography variant="h6" gutterBottom>
              Статистика міста
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body1">
              Виїздів: {stats?.outgoingCount?.toLocaleString() ?? '0'}
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body1">
              Прибуття: {stats?.incomingCount?.toLocaleString() ?? '0'}
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body1">
              Середня відстань: {stats?.averageDistance ? stats.averageDistance.toFixed(1) : '0.0'} км
            </Typography>
          </Grid>
        </Grid>
      </CardContent>
    </Card>
  );
};

export default CityStats; 