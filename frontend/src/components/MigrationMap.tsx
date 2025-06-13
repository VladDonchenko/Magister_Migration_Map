import React, { useEffect, useState } from 'react';
import { Box, Container, Typography, CircularProgress } from '@mui/material';
import { MapContainer, TileLayer, Marker, Popup, Polyline } from 'react-leaflet';
import { LatLngTuple, Icon } from 'leaflet';
import 'leaflet/dist/leaflet.css';
import migrationApi from '../utils/api/index';

interface MapData {
  nodes: Array<{
    id: string;
    name: string;
    lat: number;
    lon: number;
  }>;
  edges: Array<{
    source: string;
    target: string;
    weight: number;
  }>;
}

// Координати міст
const cityCoordinates: { [key: string]: { lat: number; lon: number } } = {
  'Київ': { lat: 50.45466, lon: 30.5238 },
  'Харків': { lat: 49.98081, lon: 36.25272 },
  'Одеса': { lat: 46.47747, lon: 30.73262 },
  'Дніпро': { lat: 48.46664, lon: 35.04066 },
  'Львів': { lat: 49.83826, lon: 24.02324 },
  'Запоріжжя': { lat: 47.82289, lon: 35.19031 },
  'Кривий Ріг': { lat: 47.90966, lon: 33.38044 },
  'Миколаїв': { lat: 46.96591, lon: 31.9974 },
  'Маріуполь': { lat: 47.09514, lon: 37.54131 },
  'Вінниця': { lat: 49.23278, lon: 28.48097 }
};

const MigrationMap: React.FC = () => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [mapData, setMapData] = useState<MapData | null>(null);

  useEffect(() => {
    const fetchMapData = async () => {
      try {
        console.log('Починаємо завантаження даних...');
        const response = await migrationApi.getMapData();
        console.log('API Response:', response);

        if (!response) {
          console.error('Response is null or undefined');
          setError('Некоректні дані від сервера');
          return;
        }

        if (!response.edges) {
          console.error('Response.edges is null or undefined');
          setError('Некоректні дані від сервера');
          return;
        }

        console.log('Edges data:', response.edges);

        // Отримуємо унікальні міста з edges
        const uniqueCities = new Set<string>();
        response.edges.forEach((edge: any) => {
          console.log('Processing edge:', edge);
          if (edge.source) uniqueCities.add(edge.source);
          if (edge.target) uniqueCities.add(edge.target);
        });

        console.log('Unique cities:', Array.from(uniqueCities));

        // Створюємо nodes на основі унікальних міст
        const nodes = Array.from(uniqueCities).map(cityName => {
          console.log('Processing city:', cityName);
          const coords = cityCoordinates[cityName];
          console.log('City coordinates:', coords);
          return {
            id: cityName,
            name: cityName,
            lat: coords?.lat || 0,
            lon: coords?.lon || 0
          };
        });

        console.log('Created nodes:', nodes);

        // Перетворюємо дані у потрібний формат
        const transformedData: MapData = {
          nodes,
          edges: response.edges.map((edge: any) => ({
            source: edge.source || '',
            target: edge.target || '',
            weight: edge.weight || 1
          })).filter((edge: any) => edge.source && edge.target)
        };

        console.log('Transformed data:', transformedData);
        setMapData(transformedData);
        setError(null);
      } catch (err) {
        console.error('Error details:', err);
        setError('Помилка при завантаженні даних карти');
      } finally {
        setLoading(false);
      }
    };

    fetchMapData();
  }, []);

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <Typography color="error">{error}</Typography>
      </Box>
    );
  }

  if (!mapData) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <Typography color="error">Немає даних для відображення</Typography>
      </Box>
    );
  }

  const defaultCenter: LatLngTuple = [48.3794, 31.1656]; // Центр України

  return (
    <Container maxWidth="lg">
      <Box sx={{ mt: 4 }}>
        <Typography variant="h4" gutterBottom>
          Карта міграції
        </Typography>
        <Box sx={{ 
          width: '100%', 
          height: '600px', 
          mt: 2,
          position: 'relative',
          zIndex: 1000,
          '& .leaflet-container': {
            width: '100%',
            height: '100%',
            zIndex: 1
          }
        }}>
          <MapContainer
            center={defaultCenter}
            zoom={6}
            style={{ width: '100%', height: '100%' }}
            zoomControl={false}
          >
            <TileLayer
              url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            />
            {mapData.nodes.map((node) => (
              <Marker
                key={node.id}
                position={[node.lat, node.lon]}
              >
                <Popup>
                  <strong>{node.name}</strong>
                </Popup>
              </Marker>
            ))}
            {mapData.edges.map((edge, index) => {
              const sourceNode = mapData.nodes.find(n => n.id === edge.source);
              const targetNode = mapData.nodes.find(n => n.id === edge.target);
              if (!sourceNode || !targetNode) return null;
              return (
                <Polyline
                  key={`line-${index}`}
                  positions={[
                    [sourceNode.lat, sourceNode.lon],
                    [targetNode.lat, targetNode.lon]
                  ]}
                  color="red"
                  weight={edge.weight}
                  opacity={0.6}
                >
                  <Popup>
                    <strong>Міграційний потік</strong>
                    <br />
                    {`${sourceNode.name} → ${targetNode.name}`}
                    <br />
                    Кількість мігрантів: {edge.weight}
                  </Popup>
                </Polyline>
              );
            })}
          </MapContainer>
        </Box>
        <Typography variant="body2" color="textSecondary" sx={{ mt: 2 }}>
          Кількість міст: {mapData.nodes.length}
          <br />
          Кількість зв'язків: {mapData.edges.length}
        </Typography>
      </Box>
    </Container>
  );
};

export default MigrationMap;
