import React, { useEffect, useState, useMemo } from 'react';
import { Box, Container, Typography, CircularProgress, Button } from '@mui/material';
import { MapContainer, TileLayer, Marker, Popup, Polyline } from 'react-leaflet';
import { LatLngTuple, Icon } from 'leaflet';
import 'leaflet/dist/leaflet.css';
import migrationApi from '../utils/api/index';
import { useNavigate } from 'react-router-dom';

interface CityNode {
    id: string;
    name: string;
    lat: number;
    lon: number;
  population?: number;
  incoming_migrations?: number;
  outgoing_migrations?: number;
}

interface MigrationEdge {
    source: string;
    target: string;
    weight: number;
}

interface MapData {
  nodes: CityNode[];
  edges: MigrationEdge[];
}

// Координати міст
const cityCoordinates: { [key: string]: { lat: number; lon: number } } = {
  "Київ": { lat: 50.45466, lon: 30.5238 },
  "Харків": { lat: 49.98081, lon: 36.25272 },
  "Одеса": { lat: 46.47747, lon: 30.73262 },
  "Дніпро": { lat: 48.46664, lon: 35.04066 },
  "Львів": { lat: 49.83826, lon: 24.02324 },
  "Запоріжжя": { lat: 47.82289, lon: 35.19031 },
  "Кривий Ріг": { lat: 47.90966, lon: 33.38044 },
  "Миколаїв": { lat: 46.96591, lon: 31.9974 },
  "Маріуполь": { lat: 47.09514, lon: 37.54131 },
  "Вінниця": { lat: 49.23278, lon: 28.48097 },
  "Полтава": { lat: 49.58827, lon: 34.55142 },
  "Черкаси": { lat: 49.44443, lon: 32.05977 },
  "Хмельницький": { lat: 49.42161, lon: 26.99653 },
  "Чернівці": { lat: 48.29149, lon: 25.94034 },
  "Житомир": { lat: 50.26487, lon: 28.67669 },
  "Суми": { lat: 50.9216, lon: 34.80029 },
  "Рівне": { lat: 50.6199, lon: 26.25162 },
  "Івано-Франківськ": { lat: 48.9215, lon: 24.70972 },
  "Камʼянець-Подільський": { lat: 48.6845, lon: 26.58559 },
  "Біла Церква": { lat: 49.80939, lon: 30.11209 },
  "Кропивницький": { lat: 48.5132, lon: 32.2597 },
  "Тернопіль": { lat: 49.55352, lon: 25.59477 },
  "Луцьк": { lat: 50.75932, lon: 25.34244 },
  "Кременчук": { lat: 49.0685, lon: 33.42041 },
  "Мелитополь": { lat: 46.84888, lon: 35.36533 },
  "Нікополь": { lat: 47.57119, lon: 34.39637 },
  "Бердянськ": { lat: 46.76644, lon: 36.79872 },
  "Словʼянськ": { lat: 48.86667, lon: 37.61667 },
  "Ужгород": { lat: 48.61667, lon: 22.3 },
  "Алчевськ": { lat: 48.47731, lon: 38.79608 },
  "Павлоград": { lat: 48.53426, lon: 35.87098 },
  "Сєвєродонецьк": { lat: 48.94832, lon: 38.49166 },
  "Євпаторія": { lat: 45.20091, lon: 33.36655 },
  "Лисичанськ": { lat: 48.90485, lon: 38.44207 },
  "Камʼянське": { lat: 48.51134, lon: 34.6021 },
  "Херсон": { lat: 46.63542, lon: 32.61687 },
  "Чернігів": { lat: 51.50551, lon: 31.28487 },
  "Горлівка": { lat: 48.29167, lon: 38.05 }
};

const MigrationMap: React.FC = () => {
  const [nodes, setNodes] = useState<CityNode[]>([]);
  const [edges, setEdges] = useState<MigrationEdge[]>([]);
  const [selectedCity, setSelectedCity] = useState<CityNode | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const navigate = useNavigate();

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
        setNodes(transformedData.nodes);
        setEdges(transformedData.edges);
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

  const handleCityClick = (cityName: string) => {
    if (selectedCity && selectedCity.id === cityName) {
      // Якщо клікнули на вже вибране місто - показуємо всі міграції
      setSelectedCity(null);
    } else {
      const city = nodes.find(node => node.id === cityName);
      if (city) {
        setSelectedCity(city);
      }
    }
  };

  const filteredEdges = useMemo(() => {
    if (!selectedCity) return edges;
    return edges.filter(edge => 
      edge.source === selectedCity.id || edge.target === selectedCity.id
    );
  }, [edges, selectedCity]);

  // Знаходимо максимальну кількість мігрантів для нормалізації
  const maxWeight = useMemo(() => {
    return Math.max(...edges.map(edge => edge.weight), 1);
  }, [edges]);

  // Функція для визначення кольору на основі відносної кількості мігрантів
  const getEdgeColor = (weight: number) => {
    const relativeWeight = weight / maxWeight;
    if (relativeWeight > 0.7) return '#ff0000'; // Червоний для високої міграції
    if (relativeWeight > 0.3) return '#ffa500'; // Оранжевий для середньої міграції
    return '#00ff00'; // Зелений для низької міграції
  };

  const filteredNodes = useMemo(() => {
    if (!selectedCity) return nodes;
    const cityNames = new Set([
      selectedCity.id,
      ...filteredEdges.map(edge => edge.source),
      ...filteredEdges.map(edge => edge.target)
    ]);
    return nodes.filter(node => cityNames.has(node.id));
  }, [nodes, selectedCity, filteredEdges]);

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
            {filteredNodes.map((node) => (
              <Marker
                key={node.id}
                position={[node.lat, node.lon]}
                eventHandlers={{
                  click: () => handleCityClick(node.id)
                }}
              >
                <Popup>
                  <div>
                    <h3>{node.name}</h3>
                    <p>Населення: {node.population?.toLocaleString() || 'Невідомо'}</p>
                  </div>
                </Popup>
              </Marker>
            ))}
            {filteredEdges.map((edge, index) => {
              const sourceNode = filteredNodes.find(n => n.id === edge.source);
              const targetNode = filteredNodes.find(n => n.id === edge.target);
              if (!sourceNode || !targetNode) return null;
              return (
                <Polyline
                  key={`${edge.source}-${edge.target}-${index}`}
                  positions={[
                    [sourceNode.lat, sourceNode.lon],
                    [targetNode.lat, targetNode.lon]
                  ]}
                  color={getEdgeColor(edge.weight)}
                  weight={Math.min(edge.weight / 10, 5)}
                >
                  <Popup>
                    <div>
                      <h3>Міграція</h3>
                      <p>З: {edge.source}</p>
                      <p>До: {edge.target}</p>
                      <p>Кількість мігрантів: {edge.weight}</p>
                    </div>
                  </Popup>
                </Polyline>
              );
            })}
          </MapContainer>
        </Box>
        <Typography variant="body2" color="textSecondary" sx={{ mt: 2 }}>
          Кількість міст: {nodes.length}
          <br />
          Кількість зв'язків: {edges.length}
        </Typography>
      </Box>
      {selectedCity && (
        <div style={{
          position: 'absolute',
          top: '20px',
          right: '20px',
          background: 'white',
          padding: '20px',
          borderRadius: '8px',
          boxShadow: '0 2px 8px rgba(0,0,0,0.15)',
          maxWidth: '300px',
          zIndex: 1000
        }}>
          <h3>{selectedCity.name}</h3>
          <p>Населення: {selectedCity.population?.toLocaleString()}</p>
          <p>Вхідні міграції: {selectedCity.incoming_migrations}</p>
          <p>Вихідні міграції: {selectedCity.outgoing_migrations}</p>
          <Button 
            type="button"
            onClick={() => navigate(`/city/${encodeURIComponent(selectedCity.name)}`)}
            style={{ marginTop: '10px' }}
          >
            Детальніше
          </Button>
        </div>
      )}
    </Container>
  );
};

export default MigrationMap;
