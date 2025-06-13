import axios from 'axios';

export interface MigrationApi {
  getMapData: () => Promise<any>;
  getAnalytics: () => Promise<any>;
  generateData: (numMigrations: number) => Promise<any>;
  clearData: () => Promise<any>;
  getCityStats: (cityName: string) => Promise<any>;
  getFlowDetails: (fromCity: string, toCity: string) => Promise<any>;
  getMigrants: (fromCity: string, toCity: string) => Promise<any>;
}

const API_BASE_URL = 'http://localhost';

const migrationApi: MigrationApi = {
  getMapData: async () => {
    const response = await axios.get(`${API_BASE_URL}/api/migration/map`);
    return response.data;
  },

  getAnalytics: async () => {
    const response = await axios.get(`${API_BASE_URL}/api/migration/analytics`);
    return response.data;
  },

  generateData: async (numMigrations: number) => {
    const response = await axios.post(`${API_BASE_URL}/api/migration/generate`, {
      size: numMigrations
    });
    return response.data;
  },

  clearData: async () => {
    const response = await axios.post(`${API_BASE_URL}/api/migration/clear`);
    return response.data;
  },

  getCityStats: async (cityName: string) => {
    const response = await axios.get(`${API_BASE_URL}/api/cities/${encodeURIComponent(cityName)}/stats`);
    return response.data;
  },

  getFlowDetails: async (fromCity: string, toCity: string) => {
    const response = await axios.get(`${API_BASE_URL}/api/migration/flow`, {
      params: { from: fromCity, to: toCity }
    });
    return response.data;
  },

  getMigrants: async (fromCity: string, toCity: string) => {
    const response = await axios.get(`${API_BASE_URL}/api/migration/migrants`, {
      params: { from: fromCity, to: toCity }
    });
    return response.data;
  }
};

export default migrationApi; 