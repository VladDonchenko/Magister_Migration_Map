import React from 'react';
import { Box, Typography, List, ListItem, ListItemText, Paper } from '@mui/material';

interface City {
  name: string;
  region: string;
  latitude: number;
  longitude: number;
  population: number;
}

interface CityListProps {
  cities: City[];
}

const CityList: React.FC<CityListProps> = ({ cities }) => {
  return (
    <Box>
      <Typography variant="h5" gutterBottom>
        Міста
      </Typography>
      <Paper>
        <List>
          {cities.map((city) => (
            <ListItem key={city.name} divider>
              <ListItemText
                primary={city.name}
                secondary={`${city.region} | Населення: ${city.population.toLocaleString()}`}
              />
            </ListItem>
          ))}
        </List>
      </Paper>
    </Box>
  );
};

export default CityList; 