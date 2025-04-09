import React from 'react';
import { Card, CardContent, Typography, Box } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

interface MigrationStatsProps {
  totalMigrants: number;
  averageAge: number;
  topRegions: Array<{ name: string; count: number }>;
  monthlyStats: Array<{ month: string; count: number }>;
}

const MigrationStats: React.FC<MigrationStatsProps> = ({
  totalMigrants,
  averageAge,
  topRegions,
  monthlyStats,
}) => {
  return (
    <Box sx={{ flexGrow: 1, p: 3 }}>
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '24px' }}>
        <div style={{ flex: '1 1 33.333%', minWidth: '300px' }}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Общая статистика
              </Typography>
              <Typography variant="body1">
                Всего мигрантов: {totalMigrants}
              </Typography>
              <Typography variant="body1">
                Средний возраст: {averageAge.toFixed(1)} лет
              </Typography>
            </CardContent>
          </Card>
        </div>
        
        <div style={{ flex: '1 1 66.666%', minWidth: '300px' }}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Топ регионов по миграции
              </Typography>
              <Box sx={{ height: 300 }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={topRegions}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="name" />
                    <YAxis />
                    <Tooltip />
                    <Bar dataKey="count" fill="#8884d8" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </CardContent>
          </Card>
        </div>

        <div style={{ flex: '1 1 100%', minWidth: '300px' }}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Динамика миграции по месяцам
              </Typography>
              <Box sx={{ height: 300 }}>
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={monthlyStats}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="month" />
                    <YAxis />
                    <Tooltip />
                    <Bar dataKey="count" fill="#82ca9d" />
                  </BarChart>
                </ResponsiveContainer>
              </Box>
            </CardContent>
          </Card>
        </div>
      </div>
    </Box>
  );
};

export default MigrationStats; 