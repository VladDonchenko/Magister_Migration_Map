import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider, createTheme, CssBaseline } from '@mui/material';
import Navigation from './components/Navigation';
import UploadData from './components/UploadData';
import Analytics from './components/Analytics';
import MigrationMap from './components/MigrationMap';
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
        <Navigation />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/map" element={<HomePage />} />
          <Route path="/upload" element={<UploadData />} />
          <Route path="/analytics" element={<Analytics />} />
          <Route path="/export" element={<div>Export Page</div>} />
        </Routes>
      </Router>
    </ThemeProvider>
  );
};

export default App; 