import React from "react";
import { Grid, TableContainer, Table, TableHead, TableBody, TableRow, TableCell, Paper } from "@mui/material";

const HotspotTabContent = () => {
  // Dummy heatmap data
  const heatmapData = "Heatmap will be displayed here";

  // Dummy data for top districts table
  const topDistricts = [
    { district: "District 1", count: 150 },
    { district: "District 2", count: 120 },
    { district: "District 3", count: 100 },
    { district: "District 4", count: 90 },
    { district: "District 5", count: 80 },
  ];

  return (
    <div>
      <Grid container spacing={2}>
        {/* Heatmap */}
        <Grid item xs={12} md={6}>
          <h3>Heatmap</h3>
          <div style={{ backgroundColor: "#f0f0f0", height: 300, display: "flex", alignItems: "center", justifyContent: "center" }}>
            {/* Heatmap */}
            {heatmapData}
          </div>
        </Grid>
        {/* Top Districts Table */}
        <Grid item xs={12} md={6}>
          <h3>Table</h3>
          <TableContainer component={Paper}>
            <Table>
              <TableHead>
                <TableRow>
                  <TableCell>District</TableCell>
                  <TableCell>Count</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {topDistricts.map((row, index) => (
                  <TableRow key={index}>
                    <TableCell>{row.district}</TableCell>
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
