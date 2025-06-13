import React from 'react';
import { AppBar, Toolbar, Typography, Button, Box } from '@mui/material';
import { Link as RouterLink } from 'react-router-dom';

const Navigation: React.FC = () => {
  return (
    <AppBar position="static">
      <Toolbar>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          Карта Міграції
        </Typography>
        <Box sx={{ display: 'flex', gap: 2 }}>
          <Button color="inherit" component={RouterLink} to="/">
            Головна
          </Button>
          <Button color="inherit" component={RouterLink} to="/map">
            Карта
          </Button>
          <Button color="inherit" component={RouterLink} to="/upload">
            Завантаження
          </Button>
          <Button color="inherit" component={RouterLink} to="/analytics">
            Аналітика
          </Button>
          <Button color="inherit" component={RouterLink} to="/export">
            Експорт
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  );
};

export default Navigation; 