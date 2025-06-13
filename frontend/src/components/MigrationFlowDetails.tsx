import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
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
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow
} from '@mui/material';
import MigrantCard from './MigrantCard';
import migrationApi from '../utils/api/index';

interface Migrant {
  id: number;
  name: string;
  age: number;
  gender: string;
  reason: string;
  date: string;
  passport_series: string;
  passport_number: string;
  registration: string;
  education: string;
  occupation: string;
  marital_status: string;
  children_count: number;
  monthly_income: number;
  transport_type: string;
  housing_type: string;
}

interface FlowData {
  fromCity: string;
  toCity: string;
  totalCount: number;
  reasons: string[];
  avgAge: number;
  genderDistribution: {
    male: number;
    female: number;
  };
  migrants: Migrant[];
}

const MigrationFlowDetails: React.FC = () => {
  const { fromCity, toCity } = useParams<{ fromCity: string; toCity: string }>();
  const [flowData, setFlowData] = useState<FlowData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [migrants, setMigrants] = useState<Migrant[]>([]);

  useEffect(() => {
    const fetchFlowData = async () => {
      try {
        setLoading(true);
        setError(null);
        
        if (!fromCity || !toCity) {
          throw new Error('Не вказано міста для пошуку');
        }
        
        // Сначала получаем детали потока
        const detailsResponse = await migrationApi.getFlowDetails(fromCity, toCity);

        if (detailsResponse.status === 404) {
          throw new Error(`Міграційний потік між містами "${fromCity}" та "${toCity}" не знайдено`);
        }

        if (!detailsResponse.ok) {
          const errorData = await detailsResponse.json();
          throw new Error(errorData.detail || 'Помилка при завантаженні деталей потоку');
        }

        const detailsData = await detailsResponse.json();
        setFlowData({
          ...detailsData,
          migrants: []
        });
        setLoading(false);

        // Затем получаем список мигрантов
        const migrantsResponse = await migrationApi.getMigrants(fromCity, toCity);

        if (!migrantsResponse.ok) {
          const errorData = await migrantsResponse.json();
          console.error('Помилка при завантаженні списку мігрантів:', errorData);
          return;
        }

        const migrantsData = await migrantsResponse.json();
        setFlowData(prev => prev ? {
          ...prev,
          migrants: Array.isArray(migrantsData) ? migrantsData : []
        } : null);
      } catch (err) {
        console.error('Помилка при отриманні даних:', err);
        setError(err instanceof Error ? err.message : 'Невідома помилка');
        setFlowData(null);
      }
    };

    const fetchMigrants = async () => {
      try {
        setLoading(true);
        const migrants = await migrationApi.getMigrants(fromCity, toCity);
        setMigrants(migrants);
        setError(null);
      } catch (err) {
        setError('Помилка при отриманні списку мігрантів');
        console.error('Error fetching migrants:', err);
      } finally {
        setLoading(false);
      }
    };

    if (fromCity && toCity) {
      fetchFlowData();
      fetchMigrants();
    }
  }, [fromCity, toCity]);

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
        <Alert severity="error">
          <Typography variant="body1" gutterBottom>
            {error}
          </Typography>
          <Typography variant="body2">
            Можливі причини:
          </Typography>
          <List dense>
            <ListItem>
              <ListItemText primary="Міграційний потік не існує в базі даних" />
            </ListItem>
            <ListItem>
              <ListItemText primary="Сервер тимчасово недоступний" />
            </ListItem>
            <ListItem>
              <ListItemText primary="Неправильний формат URL" />
            </ListItem>
          </List>
        </Alert>
      </Container>
    );
  }

  if (!flowData) {
    return null;
  }

  return (
    <Container sx={{ mt: 4 }}>
      <Paper sx={{ p: 3, mb: 3 }}>
        <Typography variant="h5" gutterBottom>
          Міграційний потік: {flowData.fromCity} → {flowData.toCity}
        </Typography>
        <Typography variant="h6" color="text.secondary">
          Кількість мігрантів: {flowData.totalCount}
        </Typography>
      </Paper>

      <Typography variant="h6" gutterBottom sx={{ mt: 3 }}>
        Список мігрантів:
      </Typography>

      <Grid container spacing={3}>
        {flowData.migrants && flowData.migrants.length > 0 ? (
          flowData.migrants.map((migrant) => (
            <Grid item xs={12} key={migrant.id}>
              <MigrantCard migrant={migrant} />
            </Grid>
          ))
        ) : (
          <Grid item xs={12}>
            <Alert severity="info">
              Немає доступних даних про мігрантів для цього потоку
            </Alert>
          </Grid>
        )}
      </Grid>
    </Container>
  );
};

export default MigrationFlowDetails; 