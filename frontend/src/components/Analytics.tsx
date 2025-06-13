import React, { useEffect, useState } from 'react';
import { Box, Typography, Paper, Grid, CircularProgress, Button, ButtonGroup } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import migrationApi from '../utils/api/index';
import FileUpload from './FileUpload';

interface AnalyticsData {
  stats: {
    total_migrations: number;
    average_age: number;
    male_percentage: number;
    female_percentage: number;
  };
  reasons: Array<{
    reason: string;
    count: number;
  }>;
  age_stats: {
    [key: string]: number;
  };
  gender_stats: Array<{
    gender: string;
    count: number;
  }>;
  top_from_cities: Array<{
    city: string;
    count: number;
  }>;
  top_to_cities: Array<{
    city: string;
    count: number;
  }>;
}

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8'];

const defaultData: AnalyticsData = {
  stats: {
    total_migrations: 0,
    average_age: 0,
    male_percentage: 0,
    female_percentage: 0
  },
  reasons: [],
  age_stats: {},
  gender_stats: [],
  top_from_cities: [],
  top_to_cities: []
};

const Analytics: React.FC = () => {
  const [data, setData] = useState<AnalyticsData>(defaultData);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [generating, setGenerating] = useState(false);
  const [clearing, setClearing] = useState(false);

  const fetchData = async () => {
    try {
      setLoading(true);
      const response = await migrationApi.getAnalytics();
      console.log('API Response:', response);
      
      const stats = response?.stats || {};
      const safeStats = {
        total_migrations: Number(stats.total_migrations) || 0,
        average_age: Number(stats.average_age) || 0,
        male_percentage: Number(stats.male_percentage) || 0,
        female_percentage: Number(stats.female_percentage) || 0
      };

      const safeReasons = Array.isArray(response?.reasons) 
        ? response.reasons.map((item: { reason?: string; count?: number }) => ({
            reason: String(item.reason || ''),
            count: Number(item.count) || 0
          }))
        : [];

      const safeGenderStats = Array.isArray(response?.gender_stats)
        ? response.gender_stats.map((item: { gender?: string; count?: number }) => ({
            gender: String(item.gender || ''),
            count: Number(item.count) || 0
          }))
        : [];

      const safeTopFromCities = Array.isArray(response?.top_from_cities)
        ? response.top_from_cities.map((item: { city?: string; count?: number }) => ({
            city: String(item.city || ''),
            count: Number(item.count) || 0
          }))
        : [];

      const safeTopToCities = Array.isArray(response?.top_to_cities)
        ? response.top_to_cities.map((item: { city?: string; count?: number }) => ({
            city: String(item.city || ''),
            count: Number(item.count) || 0
          }))
        : [];

      const safeAgeStats = response?.age_stats || {};
      const processedAgeStats: { [key: string]: number } = {};
      Object.entries(safeAgeStats).forEach(([key, value]) => {
        processedAgeStats[key] = Number(value) || 0;
      });

      setData({
        stats: safeStats,
        reasons: safeReasons,
        age_stats: processedAgeStats,
        gender_stats: safeGenderStats,
        top_from_cities: safeTopFromCities,
        top_to_cities: safeTopToCities
      });
      setError(null);
    } catch (err) {
      setError('Помилка при завантаженні даних');
      console.error('Error fetching analytics:', err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleGenerateData = async (numMigrations: number) => {
    try {
      setGenerating(true);
      await migrationApi.generateData(numMigrations);
      await fetchData();
    } catch (err) {
      setError('Помилка при генерації даних');
      console.error('Error generating data:', err);
    } finally {
      setGenerating(false);
    }
  };

  const handleClearData = async () => {
    try {
      setClearing(true);
      await migrationApi.clearData();
      await fetchData();
    } catch (err) {
      setError('Помилка при очищенні даних');
      console.error('Error clearing data:', err);
    } finally {
      setClearing(false);
    }
  };

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box p={3}>
        <Typography color="error">{error}</Typography>
      </Box>
    );
  }

  const ageData = Object.entries(data.age_stats).map(([age, count]) => ({
    age: `${age} років`,
    count: Number(count) || 0
  }));

  const formatNumber = (value: number | undefined | null): string => {
    if (value === undefined || value === null || isNaN(value)) {
      return '0.0';
    }
    return value.toFixed(1);
  };

  return (
    <div className="analytics-container">
      <h1>Аналітика міграції</h1>
      <Box mb={3}>
        <ButtonGroup variant="contained" aria-label="data management buttons">
          <Button onClick={() => handleGenerateData(100)} disabled={generating}>
            Згенерувати 100
          </Button>
          <Button onClick={() => handleGenerateData(1000)} disabled={generating}>
            Згенерувати 1000
          </Button>
          <Button onClick={() => handleGenerateData(10000)} disabled={generating}>
            Згенерувати 10000
          </Button>
          <Button onClick={() => handleGenerateData(100000)} disabled={generating}>
            Згенерувати 100000
          </Button>
          <Button onClick={handleClearData} disabled={clearing} color="error">
            Очистити дані
          </Button>
        </ButtonGroup>
      </Box>
      <FileUpload />
      <Box p={3}>
        <Paper elevation={3} sx={{ p: 3, mb: 3 }}>
          <Typography variant="h4" gutterBottom>
            Загальна статистика
          </Typography>
          <Grid container spacing={3}>
            <Grid item xs={12} sm={6} md={3}>
              <Paper sx={{ p: 2 }}>
                <Typography variant="h6">Всього міграцій</Typography>
                <Typography variant="h4">{data.stats.total_migrations}</Typography>
              </Paper>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <Paper sx={{ p: 2 }}>
                <Typography variant="h6">Середній вік</Typography>
                <Typography variant="h4">{formatNumber(data.stats.average_age)}</Typography>
              </Paper>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <Paper sx={{ p: 2 }}>
                <Typography variant="h6">Чоловіки</Typography>
                <Typography variant="h4">{formatNumber(data.stats.male_percentage)}%</Typography>
              </Paper>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <Paper sx={{ p: 2 }}>
                <Typography variant="h6">Жінки</Typography>
                <Typography variant="h4">{formatNumber(data.stats.female_percentage)}%</Typography>
              </Paper>
            </Grid>
          </Grid>
        </Paper>

        <Grid container spacing={3}>
          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <Typography variant="h5" gutterBottom>
                Розподіл за віком
              </Typography>
              <Box height={300}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={ageData}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="age" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="count" fill="#8884d8" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <Typography variant="h5" gutterBottom>
                Розподіл за статтю
              </Typography>
              <Box height={300}>
                <ResponsiveContainer width="100%" height="100%">
                  <PieChart>
                    <Pie
                      data={data.gender_stats}
                      dataKey="count"
                      nameKey="gender"
                      cx="50%"
                      cy="50%"
                      outerRadius={80}
                      label
                    >
                      {data.gender_stats.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend />
                  </PieChart>
                </ResponsiveContainer>
              </Box>
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <Typography variant="h5" gutterBottom>
                Топ-5 міст відправлення
              </Typography>
              <Box height={300}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={data.top_from_cities}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="city" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="count" fill="#82ca9d" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <Typography variant="h5" gutterBottom>
                Топ-5 міст призначення
              </Typography>
              <Box height={300}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={data.top_to_cities}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="city" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="count" fill="#ffc658" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </Paper>
          </Grid>

          <Grid item xs={12}>
            <Paper elevation={3} sx={{ p: 3 }}>
              <Typography variant="h5" gutterBottom>
                Причини міграції
              </Typography>
              <Box height={300}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={data.reasons}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="reason" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="count" fill="#ff7300" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </Paper>
          </Grid>
        </Grid>
      </Box>
    </div>
  );
};

export default Analytics; 