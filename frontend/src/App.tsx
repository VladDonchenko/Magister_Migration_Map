import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider, createTheme, CssBaseline, Box } from '@mui/material';
import Navigation from './components/Navigation';
import UploadData from './components/UploadData';
import Analytics from './components/Analytics';
import HomePage from './pages/HomePage';

const theme = createTheme({
  palette: {
    primary: {
      main: '#1976d2',
    },
    secondary: {
      main: '#dc004e',
    },
  },
});

const App: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <Box sx={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
          <Navigation />
          <Box component="main" sx={{ flexGrow: 1, position: 'relative' }}>
            <Routes>
              <Route path="/" element={<HomePage />} />
              <Route path="/map" element={<HomePage />} />
              <Route path="/upload" element={<UploadData />} />
              <Route path="/analytics" element={<Analytics />} />
              <Route path="/export" element={<div>Export Page</div>} />
            </Routes>
          </Box>
        </Box>
      </Router>
    </ThemeProvider>
  );
};

export default App; 