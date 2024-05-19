import React from 'react';
import { Bar, Pie } from 'react-chartjs-2';
import 'chart.js/auto';
import { Card, CardContent, Typography, Grid } from '@mui/material';
import MapComponent1 from './map2';  // Adjust the import based on the location of your MapComponent

const OffenderTabContent = () => {
  const genderData = {
    labels: ['Male', 'Female'],
    datasets: [
      {
        label: 'Offenders',
        data: [737881, 169964],
        backgroundColor: ['#36A2EB', '#FF6384'],
      },
    ],
  };
  
  const ageGroupData = {
    labels: ['21-40', '41-60', '0-20', '61-80', '80+'],
    datasets: [
      {
        label: 'Age Group',
        data: [55.6, 20.3, 15.4, 7.2, 1.5],
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF'],
      },
    ],
  };
  
  const options = {
    scales: {
      y: {
        beginAtZero: true,
      },
    },
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
      <Grid item xs={14} sm={6}>
      <Card>
        <CardContent>
          <Typography variant="h5" component="div">
            Gender-wise Victims
          </Typography>
          <center>
          <div style={{ height: '363px'}}>
            <br/>
            <br/>
            <Bar data={genderData} options={options} />
          </div>
          </center>
        </CardContent>
      </Card>
      </Grid>
      <Grid item xs={12} sm={6}>
        <Card>
          <CardContent>
            <Typography variant="h5" component="div">
              Age-group wise Distribution
            </Typography>
            <center>
              <div style={{ width: '100%', maxWidth: '400px', height: '363px', alignItems: 'center' }}>
              <Pie data={ageGroupData} options={pieOptions}/>
              </div>
            </center>
          </CardContent>
        </Card>
      </Grid>
      <Grid item xs={12}>
        <Card style={{ height: '500px' }}>
          <CardContent>
            <Typography variant="h5" component="div">
              Map Component
            </Typography>
            <MapComponent1 />
          </CardContent>
        </Card>
      </Grid>
    </Grid>
  );
};

export { OffenderTabContent };
