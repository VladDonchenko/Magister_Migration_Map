import React from 'react';
import {
    Box,
    Paper,
    Typography,
    Grid,
    List,
    ListItem,
    ListItemText,
    Divider,
    CircularProgress,
    Chip,
    Stack
} from '@mui/material';
import {
    LineChart,
    Line,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer
} from 'recharts';

const RouteDetails = ({ route, loading }) => {
    if (loading) {
        return (
            <Box display="flex" justifyContent="center" alignItems="center" minHeight="400px">
                <CircularProgress />
            </Box>
        );
    }

    if (!route) {
        return (
            <Box p={3}>
                <Typography variant="h6">Оберіть маршрут на карті</Typography>
            </Box>
        );
    }

    // Підготовка даних для графіка міграцій за період
    const migrationData = route.migrations.reduce((acc, migration) => {
        const date = new Date(migration.migration_date).toLocaleDateString();
        acc[date] = (acc[date] || 0) + 1;
        return acc;
    }, {});

    const chartData = Object.entries(migrationData).map(([date, count]) => ({
        date,
        count
    }));

    // Аналіз причин міграції
    const reasons = route.migrations.reduce((acc, migration) => {
        acc[migration.reason] = (acc[migration.reason] || 0) + 1;
        return acc;
    }, {});

    // Аналіз вікового розподілу
    const ageGroups = {
        '18-25': 0,
        '26-35': 0,
        '36-45': 0,
        '46-55': 0,
        '56-70': 0
    };

    route.migrations.forEach(migration => {
        const age = migration.age;
        if (age <= 25) ageGroups['18-25']++;
        else if (age <= 35) ageGroups['26-35']++;
        else if (age <= 45) ageGroups['36-45']++;
        else if (age <= 55) ageGroups['46-55']++;
        else ageGroups['56-70']++;
    });

    return (
        <Box p={3}>
            <Typography variant="h4" gutterBottom>
                Маршрут міграції
            </Typography>
            <Typography variant="h6" color="primary" gutterBottom>
                {route.from_city.name} → {route.to_city.name}
            </Typography>

            <Grid container spacing={3}>
                <Grid item xs={12}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Загальна інформація
                        </Typography>
                        <List>
                            <ListItem>
                                <ListItemText
                                    primary="Відстань"
                                    secondary={`${route.distance_km} км`}
                                />
                            </ListItem>
                            <ListItem>
                                <ListItemText
                                    primary="Загальна кількість міграцій"
                                    secondary={route.migrations.length}
                                />
                            </ListItem>
                            <ListItem>
                                <ListItemText
                                    primary="Середній вік мігрантів"
                                    secondary={`${Math.round(route.migrations.reduce((acc, m) => acc + m.age, 0) / route.migrations.length)} років`}
                                />
                            </ListItem>
                        </List>
                    </Paper>
                </Grid>

                <Grid item xs={12}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Динаміка міграцій
                        </Typography>
                        <ResponsiveContainer width="100%" height={200}>
                            <LineChart data={chartData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="date" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Line type="monotone" dataKey="count" stroke="#8884d8" />
                            </LineChart>
                        </ResponsiveContainer>
                    </Paper>
                </Grid>

                <Grid item xs={12} md={6}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Причини міграції
                        </Typography>
                        <Stack direction="row" spacing={1} flexWrap="wrap" useFlexGap>
                            {Object.entries(reasons).map(([reason, count]) => (
                                <Chip
                                    key={reason}
                                    label={`${reason}: ${count}`}
                                    color="primary"
                                    variant="outlined"
                                />
                            ))}
                        </Stack>
                    </Paper>
                </Grid>

                <Grid item xs={12} md={6}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Віковий розподіл
                        </Typography>
                        <List>
                            {Object.entries(ageGroups).map(([group, count]) => (
                                <ListItem key={group}>
                                    <ListItemText
                                        primary={group}
                                        secondary={`${count} мігрантів (${Math.round(count / route.migrations.length * 100)}%)`}
                                    />
                                </ListItem>
                            ))}
                        </List>
                    </Paper>
                </Grid>

                <Grid item xs={12}>
                    <Paper sx={{ p: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Прогнозовані причини
                        </Typography>
                        <Stack direction="row" spacing={1} flexWrap="wrap" useFlexGap>
                            {Object.entries(route.predicted_reasons || {}).map(([reason, probability]) => (
                                <Chip
                                    key={reason}
                                    label={`${reason}: ${Math.round(probability * 100)}%`}
                                    color="secondary"
                                    variant="outlined"
                                />
                            ))}
                        </Stack>
                    </Paper>
                </Grid>
            </Grid>
        </Box>
    );
};

export default RouteDetails; 