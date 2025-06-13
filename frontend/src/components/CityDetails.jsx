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
    CircularProgress
} from '@mui/material';
import {
    BarChart,
    Bar,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer
} from 'recharts';

const CityDetails = ({ city, migrations, loading }) => {
    if (loading) {
        return (
            <Box display="flex" justifyContent="center" alignItems="center" minHeight="400px">
                <CircularProgress />
            </Box>
        );
    }

    if (!city) {
        return (
            <Box p={3}>
                <Typography variant="h6">Оберіть місто на карті</Typography>
            </Box>
        );
    }

    // Підготовка даних для графіків
    const genderData = [
        { name: 'Чоловіки', value: city.gender_distribution.filter(g => g === 'Чоловік').length },
        { name: 'Жінки', value: city.gender_distribution.filter(g => g === 'Жінка').length }
    ];

    const ageGroups = {
        '18-25': 0,
        '26-35': 0,
        '36-45': 0,
        '46-55': 0,
        '56-70': 0
    };

    city.age_distribution.forEach(age => {
        if (age <= 25) ageGroups['18-25']++;
        else if (age <= 35) ageGroups['26-35']++;
        else if (age <= 45) ageGroups['36-45']++;
        else if (age <= 55) ageGroups['46-55']++;
        else ageGroups['56-70']++;
    });

    const ageData = Object.entries(ageGroups).map(([name, value]) => ({
        name,
        value
    }));

    return (
        <Box p={3}>
            <Typography variant="h4" gutterBottom>
                {city.name}
            </Typography>

            <Grid container spacing={3}>
                <Grid item xs={12} md={6}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Загальна статистика
                        </Typography>
                        <List>
                            <ListItem>
                                <ListItemText
                                    primary="Населення"
                                    secondary={city.population?.toLocaleString()}
                                />
                            </ListItem>
                            <ListItem>
                                <ListItemText
                                    primary="Еміграції"
                                    secondary={city.total_emigrations}
                                />
                            </ListItem>
                            <ListItem>
                                <ListItemText
                                    primary="Іміграції"
                                    secondary={city.total_immigrations}
                                />
                            </ListItem>
                        </List>
                    </Paper>
                </Grid>

                <Grid item xs={12} md={6}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Розподіл за статтю
                        </Typography>
                        <ResponsiveContainer width="100%" height={200}>
                            <BarChart data={genderData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="name" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Bar dataKey="value" fill="#8884d8" />
                            </BarChart>
                        </ResponsiveContainer>
                    </Paper>
                </Grid>

                <Grid item xs={12}>
                    <Paper sx={{ p: 2, mb: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Розподіл за віком
                        </Typography>
                        <ResponsiveContainer width="100%" height={200}>
                            <BarChart data={ageData}>
                                <CartesianGrid strokeDasharray="3 3" />
                                <XAxis dataKey="name" />
                                <YAxis />
                                <Tooltip />
                                <Legend />
                                <Bar dataKey="value" fill="#82ca9d" />
                            </BarChart>
                        </ResponsiveContainer>
                    </Paper>
                </Grid>

                <Grid item xs={12}>
                    <Paper sx={{ p: 2 }}>
                        <Typography variant="h6" gutterBottom>
                            Останні міграції
                        </Typography>
                        <List>
                            {migrations.slice(0, 5).map((migration, index) => (
                                <React.Fragment key={migration.id}>
                                    <ListItem>
                                        <ListItemText
                                            primary={`${migration.from_city.name} → ${migration.to_city.name}`}
                                            secondary={
                                                <>
                                                    <Typography component="span" variant="body2">
                                                        Дата: {new Date(migration.migration_date).toLocaleDateString()}
                                                    </Typography>
                                                    <br />
                                                    <Typography component="span" variant="body2">
                                                        Причина: {migration.reason}
                                                    </Typography>
                                                </>
                                            }
                                        />
                                    </ListItem>
                                    {index < 4 && <Divider />}
                                </React.Fragment>
                            ))}
                        </List>
                    </Paper>
                </Grid>
            </Grid>
        </Box>
    );
};

export default CityDetails; 