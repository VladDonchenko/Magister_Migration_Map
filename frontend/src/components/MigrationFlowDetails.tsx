import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Container,
  Typography,
  Paper,
  Grid,
  CircularProgress,
  Alert,
  List,
  ListItem,
  ListItemText,
  Box,
  Button,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';
import { PieChart, Pie, Cell, BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface MigrationFlowData {
  fromCity: string;
  toCity: string;
  totalCount: number;
  averageAge: number;
  reasons: { reason: string; count: number }[];
  transportTypes: { type: string; count: number }[];
  housingTypes: { type: string; count: number }[];
  educationLevels: { level: string; count: number }[];
  familyStatuses: { status: string; count: number }[];
  migrants: Array<{
    id: number;
    name: string;
    age: number;
    gender: string;
    education: string;
    profession: string;
    family_status: string;
    reason: string;
    transport_type: string;
    housing_type: string;
    migration_date: string;
  }>;
}

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8'];

const MigrationFlowDetails: React.FC = () => {
  const { fromCity, toCity } = useParams<{ fromCity: string; toCity: string }>();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [flowData, setFlowData] = useState<MigrationFlowData | null>(null);

  useEffect(() => {
    const fetchFlowData = async () => {
      try {
        setLoading(true);
        setError(null);

        const response = await fetch(`/api/migration/flow?from_city=${encodeURIComponent(fromCity || '')}&to_city=${encodeURIComponent(toCity || '')}`);
        if (!response.ok) {
          throw new Error('Помилка при отриманні даних');
        }

        const data = await response.json();
        setFlowData(data.details);
      } catch (err: any) {
        setError(err.message || 'Помилка при завантаженні даних');
      } finally {
        setLoading(false);
      }
    };

    fetchFlowData();
  }, [fromCity, toCity]);

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Container sx={{ mt: 4 }}>
        <Alert severity="error">{error}</Alert>
      </Container>
    );
  }

  if (!flowData) {
    return (
      <Container sx={{ mt: 4 }}>
        <Alert severity="info">Дані не знайдено</Alert>
      </Container>
    );
  }

  return (
    <Container sx={{ mt: 4 }}>
      <Button 
        startIcon={<ArrowBack />} 
        onClick={() => navigate(-1)}
        style={{ marginBottom: '24px' }}
      >
        Назад
      </Button>

      <Paper sx={{ p: 3, mb: 3 }}>
        <Typography variant="h4" gutterBottom>
          Міграційний потік: {flowData.fromCity} → {flowData.toCity}
        </Typography>
        <Typography variant="h6" color="text.secondary">
          Кількість мігрантів: {flowData.totalCount}
        </Typography>
        <Typography variant="h6" color="text.secondary">
          Середній вік: {flowData.averageAge ? flowData.averageAge.toFixed(1) : '0.0'} років
        </Typography>
      </Paper>

      <Grid container spacing={3}>
        <Grid item xs={12} md={6}>
          <Paper sx={{ p: 3 }}>
            <Typography variant="h6" gutterBottom>
              Причини міграції
            </Typography>
            <Box sx={{ height: 300 }}>
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={flowData.reasons}
                    dataKey="count"
                    nameKey="reason"
                    cx="50%"
                    cy="50%"
                    outerRadius={80}
                    label
                  >
                    {flowData.reasons.map((entry, index) => (
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
          <Paper sx={{ p: 3 }}>
            <Typography variant="h6" gutterBottom>
              Типи транспорту
            </Typography>
            <Box sx={{ height: 300 }}>
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={flowData.transportTypes}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="type" />
                  <YAxis />
                  <Tooltip />
                  <Legend />
                  <Bar dataKey="count" fill="#8884d8" />
                </BarChart>
              </ResponsiveContainer>
            </Box>
          </Paper>
        </Grid>

        <Grid item xs={12}>
          <Paper sx={{ p: 3 }}>
            <Typography variant="h6" gutterBottom>
              Список мігрантів
            </Typography>
            <TableContainer>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Ім'я</TableCell>
                    <TableCell>Вік</TableCell>
                    <TableCell>Стать</TableCell>
                    <TableCell>Освіта</TableCell>
                    <TableCell>Професія</TableCell>
                    <TableCell>Сімейний стан</TableCell>
                    <TableCell>Причина</TableCell>
                    <TableCell>Транспорт</TableCell>
                    <TableCell>Тип житла</TableCell>
                    <TableCell>Дата міграції</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {flowData.migrants.map((migrant) => (
                    <TableRow key={migrant.id}>
                      <TableCell>{migrant.name}</TableCell>
                      <TableCell>{migrant.age}</TableCell>
                      <TableCell>{migrant.gender}</TableCell>
                      <TableCell>{migrant.education}</TableCell>
                      <TableCell>{migrant.profession}</TableCell>
                      <TableCell>{migrant.family_status}</TableCell>
                      <TableCell>{migrant.reason}</TableCell>
                      <TableCell>{migrant.transport_type}</TableCell>
                      <TableCell>{migrant.housing_type}</TableCell>
                      <TableCell>{new Date(migrant.migration_date).toLocaleDateString()}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Paper>
        </Grid>
      </Grid>
    </Container>
  );
};

export default MigrationFlowDetails; 