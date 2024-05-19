import React from "react";
import { Grid, TableContainer, Table, TableHead, TableBody, TableRow, TableCell, Paper } from "@mui/material";
import hotspotImage from "./hotspot.png"; // Import the image file

const HotspotTabContent = () => {
  // Dummy data for top districts table
  const topDistricts = [
    { district: "Tumakuru", count: 66879 },
    { district: "Hassan", count: 64399 },
    { district: "Shivamogga", count: 58342 },
    { district: "Mandya", count: 54474 },
    { district: "Chitradurga", count: 46664 },
  ];

  return (
    <div>
      <Grid container spacing={2}>
        {/* Heatmap */}
        <Grid item xs={12} md={6}>
          <h3>Heatmap</h3>
          <div style={{ backgroundColor: "#f0f0f0", height: 300, display: "flex", alignItems: "center", justifyContent: "center" }}>
            {/* Heatmap */}
            <img src={hotspotImage} alt="Heatmap" style={{ width: '100%', height: '100%' }} />
          </div>
        </Grid>
        {/* Top Districts Table */}
        <Grid item xs={12} md={6}>
          <h3>Table</h3>
          <TableContainer component={Paper}>
            <Table>
                <TableRow>
                  <TableCell style={{ paddingLeft: '90px' }}><b>District</b></TableCell>
                  <TableCell><b>Count</b></TableCell>
                </TableRow>
              <TableBody>
                {topDistricts.map((row, index) => (
                  <TableRow key={index}>
                    <TableCell style={{ paddingLeft: '90px' }} >{row.district}</TableCell>
                    <TableCell>{row.count}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </Grid>
      </Grid>
    </div>
  );
};

export { HotspotTabContent };
