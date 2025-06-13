import React from 'react';
import { Box, Typography, Button, Container, Paper } from '@mui/material';

const UploadData: React.FC = () => {
  return (
    <Container maxWidth="md">
      <Box sx={{ mt: 4 }}>
        <Paper sx={{ p: 3 }}>
          <Typography variant="h4" gutterBottom>
            Завантаження даних
          </Typography>
          <Typography variant="body1" paragraph>
            Функціональність завантаження даних знаходиться в розробці.
          </Typography>
          <Button variant="contained" disabled>
            Завантажити файл
          </Button>
        </Paper>
      </Box>
    </Container>
  );
};

export default UploadData;
