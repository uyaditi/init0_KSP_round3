import React, { useState } from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";
import { Grid,FormControl, InputLabel, Select, MenuItem } from "@mui/material";

// Victim Tab Content Component
const TrendsTabContent = () => {
  // Example data for Victim tab
  const victimData = [
    { name: "Jan", value: 400 },
    { name: "Feb", value: 300 },
    { name: "Mar", value: 200 },
    { name: "Apr", value: 278 },
    { name: "May", value: 189 },
    { name: "Jun", value: 239 },
    { name: "Jul", value: 349 },
    { name: "Aug", value: 230 },
    { name: "Sep", value: 400 },
    { name: "Oct", value: 500 },
    { name: "Nov", value: 390 },
    { name: "Dec", value: 600 },
  ];

  // Crime data for Crime trend over years
  const crimeData = {
    burglary: [
      { year: 2019, value: 300 },
      { year: 2020, value: 250 },
      { year: 2021, value: 200 },
      { year: 2022, value: 180 },
      { year: 2023, value: 220 },
    ],
    robbery: [
      { year: 2019, value: 150 },
      { year: 2020, value: 120 },
      { year: 2021, value: 100 },
      { year: 2022, value: 90 },
      { year: 2023, value: 110 },
    ],
    assault: [
      { year: 2019, value: 200 },
      { year: 2020, value: 180 },
      { year: 2021, value: 160 },
      { year: 2022, value: 140 },
      { year: 2023, value: 160 },
    ],
  };

  // Gender data for Future Crime trends
  const genderData = {
    male: [
      { year: 2023, value: 500 },
      { year: 2024, value: 550 },
      { year: 2025, value: 600 },
    ],
    female: [
      { year: 2023, value: 250 },
      { year: 2024, value: 270 },
      { year: 2025, value: 290 },
    ],
  };

  const [selectedCrime, setSelectedCrime] = useState("burglary");
  const [selectedGender, setSelectedGender] = useState("male");

  const handleCrimeChange = (event) => {
    setSelectedCrime(event.target.value);
  };

  const handleGenderChange = (event) => {
    setSelectedGender(event.target.value);
  };

  return (
    <div>
      <Grid container spacing={2}>
        <Grid item xs={12} md={6}>
          <h3>Crime Trend over Years</h3>
          <FormControl sx={{ m: 2, minWidth: 120 }}>
            <InputLabel id="crime-select-label">Crime Type</InputLabel>
            <Select
              labelId="crime-select-label"
              id="crime-select"
              value={selectedCrime}
              onChange={handleCrimeChange}
            >
              <MenuItem value="burglary">Burglary</MenuItem>
              <MenuItem value="robbery">Robbery</MenuItem>
              <MenuItem value="assault">Assault</MenuItem>
            </Select>
          </FormControl>
          <LineChart width={600} height={400} data={crimeData[selectedCrime]}>
            <XAxis dataKey="year" />
            <YAxis />
            <CartesianGrid stroke="#eee" />
            <Line type="monotone" dataKey="value" stroke="#000000"/>
            <Tooltip />
            <Legend />
          </LineChart>
        </Grid>
        <Grid item xs={12} md={6}>
          <h3>Future Crime Trends</h3>
          <FormControl sx={{ m: 1, minWidth: 120 }}>
            <InputLabel id="gender-select-label">Gender</InputLabel>
            <Select
              labelId="gender-select-label"
              id="gender-select"
              value={selectedGender}
              onChange={handleGenderChange}
            >
              <MenuItem value="male">Male</MenuItem>
              <MenuItem value="female">Female</MenuItem>
            </Select>
          </FormControl>
          <LineChart width={600} height={400} data={genderData[selectedGender]}>
            <XAxis dataKey="year" />
            <YAxis />
            <CartesianGrid stroke="#eee" />
            <Line type="monotone" dataKey="value" stroke="#000000" />
            <Tooltip />
            <Legend />
          </LineChart>
        </Grid>
      </Grid>
    </div>
  );
};

export { TrendsTabContent };