import React, { useState, useEffect } from 'react';
import { Card, CardContent, Typography, List, ListItem, ListItemText, CircularProgress } from '@mui/material';

interface CityMigrationFlowsProps {
  cityName: string;
}

interface MigrationFlow {
  id: string;
  sourceCity: string;
  targetCity: string;
  count: number;
  year: number;
}

const CityMigrationFlows: React.FC<CityMigrationFlowsProps> = ({ cityName }) => {
  const [loading, setLoading] = useState(true);
  const [flows, setFlows] = useState<MigrationFlow[]>([]);

  useEffect(() => {
    const fetchFlows = async () => {
      try {
        const response = await fetch(`/api/v1/cities/${cityName}/flows`);
        if (!response.ok) {
          throw new Error('Failed to fetch migration flows');
        }
        const data = await response.json();
        setFlows(data);
      } catch (error) {
        console.error('Error fetching migration flows:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchFlows();
  }, [cityName]);

  if (loading) {
    return (
      <Card>
        <CardContent>
          <CircularProgress />
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          Потоки міграції
        </Typography>
        <List>
          {flows.map((flow) => (
            <ListItem key={flow.id} divider>
              <ListItemText
                primary={`${flow.sourceCity} → ${flow.targetCity}`}
                secondary={`Кількість: ${flow.count.toLocaleString()} | Рік: ${flow.year}`}
              />
            </ListItem>
          ))}
          {flows.length === 0 && (
            <ListItem>
              <ListItemText primary="Немає даних про міграційні потоки" />
            </ListItem>
          )}
        </List>
      </CardContent>
    </Card>
  );
};

export default CityMigrationFlows; 