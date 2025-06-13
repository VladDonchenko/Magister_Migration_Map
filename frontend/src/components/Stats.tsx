import React from 'react';
import { Box, Typography, Grid, Paper } from '@mui/material';
import { styled } from '@mui/material/styles';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(2),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

interface StatsProps {
  stats: {
    total_migrations?: number;
    total_cities?: number;
    total_people?: number;
    avg_distance?: number;
    most_common_reasons?: string[];
    monthly_stats?: Array<{
      month: string;
      count: number;
    }>;
  };
}

const Stats: React.FC<StatsProps> = ({ stats }) => {
  // Безопасное получение значений с проверкой на undefined
  const totalMigrations = stats?.total_migrations ?? 0;
  const totalCities = stats?.total_cities ?? 0;
  const totalPeople = stats?.total_people ?? 0;
  const avgDistance = stats?.avg_distance ?? 0;
  const reasons = stats?.most_common_reasons ?? [];
  const monthlyStats = stats?.monthly_stats ?? [];

  return (
    <Box sx={{ flexGrow: 1, mt: 3 }}>
      <Typography variant="h4" gutterBottom>
        Статистика міграції
      </Typography>
      <Grid container spacing={3}>
        <Grid item xs={12} sm={6} md={3}>
          <Item>
            <Typography variant="h6">Всього міграцій</Typography>
            <Typography variant="h4">{totalMigrations.toLocaleString()}</Typography>
          </Item>
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <Item>
            <Typography variant="h6">Міст</Typography>
            <Typography variant="h4">{totalCities}</Typography>
          </Item>
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <Item>
            <Typography variant="h6">Мігрантів</Typography>
            <Typography variant="h4">{totalPeople.toLocaleString()}</Typography>
          </Item>
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <Item>
            <Typography variant="h6">Середня відстань</Typography>
            <Typography variant="h4">{avgDistance.toFixed(1)} км</Typography>
          </Item>
        </Grid>
      </Grid>

      <Box sx={{ mt: 4 }}>
        <Typography variant="h5" gutterBottom>
          Найпоширеніші причини
        </Typography>
        <Grid container spacing={2}>
          {reasons.map((reason, index) => (
            <Grid item xs={12} sm={6} md={4} key={index}>
              <Item>
                <Typography>{reason}</Typography>
              </Item>
            </Grid>
          ))}
        </Grid>
      </Box>

      <Box sx={{ mt: 4 }}>
        <Typography variant="h5" gutterBottom>
          Місячна статистика
        </Typography>
        <Grid container spacing={2}>
          {monthlyStats.map((stat, index) => (
            <Grid item xs={12} sm={6} md={4} key={index}>
              <Item>
                <Typography variant="h6">{stat.month}</Typography>
                <Typography>{stat.count} міграцій</Typography>
              </Item>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Box>
  );
};

export default Stats; 