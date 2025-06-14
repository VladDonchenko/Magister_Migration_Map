import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Spin } from 'antd';
import { 
  Card, 
  Typography, 
  Button, 
  Grid,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

interface CityStats {
  name: string;
  population: number;
  region: string;
  country: string;
  lat: number;
  lon: number;
  incomingCount: number;
  outgoingCount: number;
  averageDistance: number;
}

interface MigrationData {
  source: string;
  target: string;
  weight: number;
}

interface DateTime {
  _DateTime__date: string;
}

interface Migrant {
  name: string;
  age: number;
  gender: string;
  education: string;
  profession: string;
  family_status: string;
  reason: string;
  transport_type: string;
  housing_type: string;
  date: DateTime;
  distance_km: number;
  from_city?: string;
  to_city?: string;
}

const CityPage: React.FC = () => {
  const { cityName } = useParams<{ cityName: string }>();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [cityStats, setCityStats] = useState<CityStats | null>(null);
  const [incomingMigrations, setIncomingMigrations] = useState<MigrationData[]>([]);
  const [outgoingMigrations, setOutgoingMigrations] = useState<MigrationData[]>([]);
  const [incomingMigrants, setIncomingMigrants] = useState<Migrant[]>([]);
  const [outgoingMigrants, setOutgoingMigrants] = useState<Migrant[]>([]);

  useEffect(() => {
    const fetchCityData = async () => {
      try {
        const response = await fetch(`/api/cities/${cityName}/stats`);
        const data = await response.json();
        setCityStats(data);
        
        // Отримуємо детальну інформацію про міграції
        const migrationsResponse = await fetch(`/api/cities/${cityName}/migrations`);
        const migrationsData = await migrationsResponse.json();
        setIncomingMigrations(migrationsData.incoming);
        setOutgoingMigrations(migrationsData.outgoing);

        // Отримуємо інформацію про мігрантів
        const migrantsResponse = await fetch(`/api/cities/${cityName}/migrants`);
        const migrantsData = await migrantsResponse.json();
        setIncomingMigrants(migrantsData.incoming);
        setOutgoingMigrants(migrantsData.outgoing);
      } catch (error) {
        console.error('Error fetching city data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchCityData();
  }, [cityName]);

  if (loading) {
    return (
      <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <Spin size="large" />
      </div>
    );
  }

  return (
    <div style={{ padding: '24px' }}>
      <Button 
        startIcon={<ArrowBack />} 
        onClick={() => navigate('/')}
        style={{ marginBottom: '24px' }}
      >
        Повернутися на карту
      </Button>

      <h1>{cityStats?.name}</h1>

      <Card style={{ marginBottom: 16 }}>
        <Typography variant="h5" gutterBottom>
          Статистика міста {cityStats?.name}
        </Typography>
        <Typography variant="body1">Населення: {cityStats?.population}</Typography>
        <Typography variant="body1">Регіон: {cityStats?.region}</Typography>
        <Typography variant="body1">
          Вхідні міграції: {cityStats?.incomingCount > 0 ? cityStats?.incomingCount : 'відсутні'}
        </Typography>
        <Typography variant="body1">
          Вихідні міграції: {cityStats?.outgoingCount > 0 ? cityStats?.outgoingCount : 'відсутні'}
        </Typography>
        <Typography variant="body1">Середня відстань: {cityStats?.averageDistance?.toFixed(2)} км</Typography>
        <Button 
          variant="contained" 
          color="primary" 
          onClick={() => navigate(`/city/${cityStats?.name}`)}
          style={{ marginTop: '16px' }}
        >
          Детальніше
        </Button>
      </Card>

      <Grid container spacing={2}>
        <Grid item xs={12} md={6}>
          <Card>
            <Typography variant="h6" style={{ padding: '16px' }}>Вхідні міграції</Typography>
            <TableContainer component={Paper}>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Місто</TableCell>
                    <TableCell>Кількість</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {incomingMigrations.map((migration) => (
                    <TableRow key={migration.source}>
                      <TableCell>{migration.source}</TableCell>
                      <TableCell>{migration.weight}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Card>
        </Grid>
        <Grid item xs={12} md={6}>
          <Card>
            <Typography variant="h6" style={{ padding: '16px' }}>Вихідні міграції</Typography>
            <TableContainer component={Paper}>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Місто</TableCell>
                    <TableCell>Кількість</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {outgoingMigrations.map((migration) => (
                    <TableRow key={migration.target}>
                      <TableCell>{migration.target}</TableCell>
                      <TableCell>{migration.weight}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Card>
        </Grid>
      </Grid>

      <Grid container spacing={2} style={{ marginTop: '16px' }}>
        <Grid item xs={12} md={6}>
          <Card>
            <Typography variant="h6" style={{ padding: '16px' }}>Люди, які в'їжджають</Typography>
            <TableContainer component={Paper}>
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
                    <TableCell>Житло</TableCell>
                    <TableCell>Дата</TableCell>
                    <TableCell>Відстань</TableCell>
                    <TableCell>З міста</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {incomingMigrants.map((migrant, index) => (
                    <TableRow key={index}>
                      <TableCell>{migrant.name}</TableCell>
                      <TableCell>{migrant.age}</TableCell>
                      <TableCell>{migrant.gender}</TableCell>
                      <TableCell>{migrant.education}</TableCell>
                      <TableCell>{migrant.profession}</TableCell>
                      <TableCell>{migrant.family_status}</TableCell>
                      <TableCell>{migrant.reason}</TableCell>
                      <TableCell>{migrant.transport_type}</TableCell>
                      <TableCell>{migrant.housing_type}</TableCell>
                      <TableCell>{migrant.date ? new Date(migrant.date._DateTime__date).toLocaleDateString() : 'Н/Д'}</TableCell>
                      <TableCell>{migrant.distance_km} км</TableCell>
                      <TableCell>{migrant.from_city}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Card>
        </Grid>
        <Grid item xs={12} md={6}>
          <Card>
            <Typography variant="h6" style={{ padding: '16px' }}>Люди, які виїжджають</Typography>
            <TableContainer component={Paper}>
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
                    <TableCell>Житло</TableCell>
                    <TableCell>Дата</TableCell>
                    <TableCell>Відстань</TableCell>
                    <TableCell>В місто</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {outgoingMigrants.map((migrant, index) => (
                    <TableRow key={index}>
                      <TableCell>{migrant.name}</TableCell>
                      <TableCell>{migrant.age}</TableCell>
                      <TableCell>{migrant.gender}</TableCell>
                      <TableCell>{migrant.education}</TableCell>
                      <TableCell>{migrant.profession}</TableCell>
                      <TableCell>{migrant.family_status}</TableCell>
                      <TableCell>{migrant.reason}</TableCell>
                      <TableCell>{migrant.transport_type}</TableCell>
                      <TableCell>{migrant.housing_type}</TableCell>
                      <TableCell>{migrant.date ? new Date(migrant.date._DateTime__date).toLocaleDateString() : 'Н/Д'}</TableCell>
                      <TableCell>{migrant.distance_km} км</TableCell>
                      <TableCell>{migrant.to_city}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Card>
        </Grid>
      </Grid>
    </div>
  );
};

export default CityPage; 