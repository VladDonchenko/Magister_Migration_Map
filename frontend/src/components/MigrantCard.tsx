import React from 'react';
import {
  Card,
  CardContent,
  Typography,
  Grid
} from '@mui/material';

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

interface MigrantCardProps {
  migrant: Migrant;
}

const MigrantCard: React.FC<MigrantCardProps> = ({ migrant }) => {
  return (
    <Card sx={{ mb: 2 }}>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          {migrant.name}
        </Typography>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={6}>
            <Typography variant="body2" color="text.secondary">
              Вік: {migrant.age}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Стать: {migrant.gender}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Причина міграції: {migrant.reason}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Дата міграції: {migrant.date}
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body2" color="text.secondary">
              Паспорт: {migrant.passport_series} {migrant.passport_number}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Приписка: {migrant.registration}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Освіта: {migrant.education}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Професія: {migrant.occupation}
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body2" color="text.secondary">
              Сімейний стан: {migrant.marital_status}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Кількість дітей: {migrant.children_count}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Місячний дохід: {migrant.monthly_income} грн
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6}>
            <Typography variant="body2" color="text.secondary">
              Транспорт: {migrant.transport_type}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Тип житла: {migrant.housing_type}
            </Typography>
          </Grid>
        </Grid>
      </CardContent>
    </Card>
  );
};

export default MigrantCard; 