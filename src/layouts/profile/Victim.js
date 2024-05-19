import React from 'react';
import { Bar, Pie } from 'react-chartjs-2';
import 'chart.js/auto';
import { Card, CardContent, Typography, Grid } from '@mui/material';
import MapComponent from './map1.js';  // Adjust the import based on the location of your MapComponent

const VictimTabContent = () => {
  const barData = {
    labels: ['Male', 'Female'],
    datasets: [
      {
        label: 'Victims',
        data: [995123, 469964],
        backgroundColor: ['#36A2EB', '#FF6384'],
      },
    ],
  };

  const barOptions = {
    scales: {
      y: {
        beginAtZero: true,
      },
    },
  };

  const pieData = {
    labels: ['21-40', '41-60', '0-20', '61-80', '80+'],
    datasets: [
      {
        data: [51.6, 29.3, 10.4, 8.2, 0.5],
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'],
      },
    ],
  };

  const pieOptions = {
    plugins: {
      legend: {
        display: true,
        position: 'right',
      },
    },
  };

  return (
    <Grid container spacing={3} mt={5}>
      <Grid item xs={12} sm={6}>
        <Card>
          <CardContent>
            <Typography variant="h5" component="div">
              Gender-wise victims
            </Typography>
            <Bar data={barData} options={barOptions} height={200} />
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={12} sm={6}>
        <Card>
          <CardContent>
            <Typography variant="h5" component="div">
              Age-group wise victim distribution
            </Typography>
            <center>
              <div style={{ width: '100%', maxWidth: '400px', height: '415px', alignItems: 'center' }}>
                <Pie data={pieData} options={pieOptions} />
              </div>
            </center>
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={12}>
        <Card style={{ height: '500px' }}>
          <CardContent>
            <Typography variant="h5" component="div" mb={2}>
              District-wise victims distribution
            </Typography>
            <MapComponent />
          </CardContent>
        </Card>
      </Grid>
    </Grid>
  );
};

export { VictimTabContent };
