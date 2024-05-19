import React, { useState } from 'react';
import { Grid, TextField, Select, MenuItem, Typography, Box, Button } from '@material-ui/core';
import { makeStyles } from '@material-ui/core/styles';
import { GoogleMap, LoadScript, Circle, Marker, InfoWindow } from '@react-google-maps/api';

const mapStyles = [
  {
    featureType: 'all',
    elementType: 'labels.icon',
    stylers: [{ visibility: 'off' }],
  },
];

const defaultCenter = { lat: 15.3173, lng: 75.7139 };

const useStyles = makeStyles((theme) => ({
  root: {
    height: '100vh',
    display: 'flex',
    flexDirection: 'column',
  },
  inputSection: {
    backgroundColor: theme.palette.grey[200],
    padding: theme.spacing(2),
    height: '100%',
  },
  mapSection: {
    flexGrow: 1,
    height: '100vh',
  },
}));

function CrimeReportForm() {
  const classes = useStyles();
  const [location, setLocation] = useState('');
  const [unit, setUnit] = useState('');
  const [startTime, setStartTime] = useState('');
  const [endTime, setEndTime] = useState('');
  const [reason, setReason] = useState('');
  const [marker, setMarker] = useState(null);
  const [circle, setCircle] = useState(null);
  const [reportList, setReportList] = useState([]);
  const [selectedReport, setSelectedReport] = useState(null);
  const [apiKey] = useState('AIzaSyBV853OPCEtlHQsWFqIebMdIhDFpxurTBM');
  const [mapRef, setMapRef] = useState(null);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(
        `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(location)}&key=${apiKey}`
      );
      const data = await response.json();

      if (data.status === 'OK') {
        const { lat, lng } = data.results[0].geometry.location;

        setMarker({ lat, lng });

        setCircle({
          lat,
          lng,
          radius: 1000,
          strokeColor: '#FF0000',
          fillColor: '#FF0000',
          strokeWeight: 2,
          fillOpacity: 0.3,
        });

        setReportList((prevList) => [
          ...prevList,
          {
            lat,
            lng,
            unit,
            startTime,
            endTime,
            reason,
          },
        ]);

        if (mapRef) {
          mapRef.panTo({ lat, lng });
          mapRef.setZoom(12);
        }
      } else {
        console.error('Geocode was not successful for the following reason:', data.status);
      }
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const handleMarkerClick = (report) => {
    setSelectedReport(report);
  };

  const handleInfoWindowClose = () => {
    setSelectedReport(null);
  };

  return (
    <div className={classes.root}>
      <Grid container>
        <Grid item xs={12} md={4} lg={3} className={classes.inputSection}>
        <Typography variant="h6" gutterBottom>
            Beat Deployment
          </Typography>
          <Box mt={2}>
            <Typography variant="body1">Location</Typography>
            <TextField
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              fullWidth
              variant="outlined"
            />
          </Box>
          <Box mt={2}>
            <Typography variant="body1">Select Unit</Typography>
            <Select
              value={unit}
              onChange={(e) => setUnit(e.target.value)}
              fullWidth
              variant="outlined"
            >
              <MenuItem value="">Select Unit</MenuItem>
              <MenuItem value="unit1">Unit 1</MenuItem>
              <MenuItem value="unit2">Unit 2</MenuItem>
              {/* Add more options as needed */}
            </Select>
          </Box>
          <Box mt={2}>
            <Typography variant="body1">Start Time</Typography>
            <TextField
              type="time"
              value={startTime}
              onChange={(e) => setStartTime(e.target.value)}
              fullWidth
              variant="outlined"
              InputLabelProps={{
                shrink: true,
              }}
            />
          </Box>
          <Box mt={2}>
            <Typography variant="body1">End Time</Typography>
            <TextField
              type="time"
              value={endTime}
              onChange={(e) => setEndTime(e.target.value)}
              fullWidth
              variant="outlined"
              InputLabelProps={{
                shrink: true,
              }}
            />
          </Box>
          <Box mt={2}>
            <Typography variant="body1">Reason</Typography>
            <TextField
              value={reason}
              onChange={(e) => setReason(e.target.value)}
              fullWidth
              variant="outlined"
              multiline
              rows={4}
            />
          </Box>
          <Box mt={2}>
            <Button variant="contained" color="primary" onClick={handleSubmit}>
              Submit
            </Button>
          </Box>
        </Grid>
        <Grid item xs={12} md={8} lg={9} className={classes.mapSection}>
          <LoadScript googleMapsApiKey={apiKey}>
            <GoogleMap
              mapContainerStyle={{ height: '100%', width: '100%' }}
              zoom={7}
              center={defaultCenter}
              options={{
                styles: mapStyles,
                disableDefaultUI: true,
                zoomControl: false,
                streetViewControl: false,
                clickableIcons: false,
              }}
              onLoad={(map) => setMapRef(map)}
            >
              {reportList.map((report, index) => (
                <Marker
                  key={index}
                  position={{ lat: report.lat, lng: report.lng }}
                  onClick={() => handleMarkerClick(report)}
                />
              ))}
              {circle && <Circle center={{ lat: circle.lat, lng: circle.lng }} radius={circle.radius} options={circle} />}
              {selectedReport && (
                <InfoWindow
                  position={{ lat: selectedReport.lat, lng: selectedReport.lng }}
                  onCloseClick={handleInfoWindowClose}
                >
                  <div>
                    <p>Unit: {selectedReport.unit}</p>
                    <p>Start Time: {selectedReport.startTime}</p>
                    <p>End Time: {selectedReport.endTime}</p>
                    <p>Reason: {selectedReport.reason}</p>
                  </div>
                </InfoWindow>
              )}
            </GoogleMap>
          </LoadScript>
        </Grid>
      </Grid>
    </div>
  );
}

export default CrimeReportForm;