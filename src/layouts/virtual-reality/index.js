import React from 'react';
import { Card, CardContent, Typography } from '@material-ui/core';
import { makeStyles } from '@material-ui/core/styles';
import CrimeReportComponent from 'layouts/tables/beats'; // Import the component to be loaded

const useStyles = makeStyles((theme) => ({
  card: {
    margin: theme.spacing(2),
    maxWidth: 1400,
    marginLeft: 300,
    maxHeight: 770 
  },
}));

function CrimeReportForm() {
  const classes = useStyles();

  return (
    <Card className={classes.card}>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          Beat Deployment
        </Typography>
        <CrimeReportComponent />
      </CardContent>
    </Card>
  );
}

export default CrimeReportForm;
