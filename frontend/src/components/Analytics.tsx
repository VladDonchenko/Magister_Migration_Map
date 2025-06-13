import React, { useEffect, useState } from 'react';
import { Box, Typography, Paper, Grid, CircularProgress, Button, ButtonGroup } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import migrationApi from '../utils/api/index';
import FileUpload from './FileUpload';

interface AnalyticsData {
  stats: {
    total_migrations: number;
    average_age: number;
    most_common_reason: string;
    most_common_transport: string;
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
    most_common_reason: '',
    most_common_transport: '',
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
  const [data, setData] = useState<AnalyticsData>({
    stats: {
      total_migrations: 0,
      average_age: 0,
      most_common_reason: '',
      most_common_transport: '',
      male_percentage: 0,
      female_percentage: 0
    },
    reasons: [],
    top_from_cities: [],
    top_to_cities: [],
    age_stats: {},
    gender_stats: []
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [generating, setGenerating] = useState(false);
  const [clearing, setClearing] = useState(false);

  useEffect(() => {
    console.log('Current data state:', data);
    console.log('Stats:', data.stats);
    console.log('Top from cities:', data.top_from_cities);
    console.log('Top to cities:', data.top_to_cities);
    console.log('Reasons:', data.reasons);
  }, [data]);

  const fetchData = async () => {
    try {
      setLoading(true);
      const response = await migrationApi.getAnalytics();
      console.log('Raw API Response:', response);
      
      const stats = {
        total_migrations: response?.total_stats?.total_migrations || 0,
        average_age: response?.total_stats?.average_age || 0,
        most_common_reason: response?.total_stats?.most_common_reason || 'Немає даних',
        most_common_transport: response?.total_stats?.most_common_transport || 'Немає даних',
        male_percentage: response?.total_stats?.male_percentage || 0,
        female_percentage: response?.total_stats?.female_percentage || 0
      };
      console.log('Processed stats:', stats);
      
      const newData = {
        stats,
        reasons: response?.migration_reasons || [],
        top_from_cities: response?.top_outgoing_cities || [],
        top_to_cities: response?.top_incoming_cities || [],
        age_stats: response?.age_stats || {},
        gender_stats: response?.gender_stats || []
      };
      console.log('New data to be set:', newData);
      
      setData(newData);
      console.log('Data set to state');
      setError(null);
    } catch (err) {
      console.error('Error fetching analytics:', err);
      setError('Помилка при отриманні даних');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  useEffect(() => {
    console.log('Data for charts:', {
      topFromCities: data.top_from_cities,
      topToCities: data.top_to_cities,
      reasons: data.reasons,
      stats: data.stats
    });
  }, [data]);

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
      <Typography variant="h4" gutterBottom>
        Аналітика міграції 1
      </Typography>
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
        <Grid container spacing={3}>
          <Grid item xs={12}>
            <Paper elevation={3} sx={{ p: 3 }}>
              <>
                <Typography variant="h5" gutterBottom>
                  Загальна статистика
                </Typography>
                <Grid container spacing={2}>
                  <Grid item xs={12} sm={6} md={3}>
                    <Paper elevation={2} sx={{ p: 2, textAlign: 'center' }}>
                      <Typography variant="h6" color="primary">
                        {data.stats.total_migrations}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Всього міграцій
                      </Typography>
                    </Paper>
                  </Grid>
                  <Grid item xs={12} sm={6} md={3}>
                    <Paper elevation={2} sx={{ p: 2, textAlign: 'center' }}>
                      <Typography variant="h6" color="primary">
                        {data.stats.average_age.toFixed(1)}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Середній вік
                      </Typography>
                    </Paper>
                  </Grid>
                  <Grid item xs={12} sm={6} md={3}>
                    <Paper elevation={2} sx={{ p: 2, textAlign: 'center' }}>
                      <Typography variant="h6" color="primary">
                        {data.stats.most_common_reason}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Найпоширеніша причина
                      </Typography>
                    </Paper>
                  </Grid>
                  <Grid item xs={12} sm={6} md={3}>
                    <Paper elevation={2} sx={{ p: 2, textAlign: 'center' }}>
                      <Typography variant="h6" color="primary">
                        {data.stats.most_common_transport}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Найпоширеніший транспорт
                      </Typography>
                    </Paper>
                  </Grid>
                </Grid>
              </>
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <>
                <Typography variant="h5" gutterBottom>
                  Топ-5 міст відправлення
                </Typography>
                {data.top_from_cities && data.top_from_cities.length > 0 ? (
                  <Box height={300}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={data.top_from_cities}>
                        <CartesianGrid strokeDasharray="3 3" />
                        <XAxis dataKey="city" />
                        <YAxis />
                        <Tooltip />
                        <Legend />
                        <Bar dataKey="outgoing_count" fill="#82ca9d" name="Кількість виїздів" />
                      </BarChart>
                    </ResponsiveContainer>
                  </Box>
                ) : (
                  <Typography>Немає даних</Typography>
                )}
              </>
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper elevation={3} sx={{ p: 3, height: '100%' }}>
              <>
                <Typography variant="h5" gutterBottom>
                  Топ-5 міст призначення
                </Typography>
                {data.top_to_cities && data.top_to_cities.length > 0 ? (
                  <Box height={300}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={data.top_to_cities}>
                        <CartesianGrid strokeDasharray="3 3" />
                        <XAxis dataKey="city" />
                        <YAxis />
                        <Tooltip />
                        <Legend />
                        <Bar dataKey="incoming_count" fill="#ffc658" name="Кількість приїздів" />
                      </BarChart>
                    </ResponsiveContainer>
                  </Box>
                ) : (
                  <Typography>Немає даних</Typography>
                )}
              </>
            </Paper>
          </Grid>

          <Grid item xs={12}>
            <Paper elevation={3} sx={{ p: 3 }}>
              <>
                <Typography variant="h5" gutterBottom>
                  Причини міграції
                </Typography>
                {data.reasons && data.reasons.length > 0 ? (
                  <Box height={300}>
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart data={data.reasons}>
                        <CartesianGrid strokeDasharray="3 3" />
                        <XAxis dataKey="reason" />
                        <YAxis />
                        <Tooltip />
                        <Legend />
                        <Bar dataKey="count" fill="#ff7300" name="Кількість мігрантів" />
                      </BarChart>
                    </ResponsiveContainer>
                  </Box>
                ) : (
                  <Typography>Немає даних</Typography>
                )}
              </>
            </Paper>
          </Grid>
        </Grid>
      </Box>
    </div>
  );
};

export default Analytics; 