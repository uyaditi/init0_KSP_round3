import React from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";


// Criminal Profiling Tab Content Component
const CriminalProfilingTabContent = () => {
    // Example data for Criminal Profiling tab
    const profilingData = [
      { name: "Jan", value: 120 },
      { name: "Feb", value: 300 },
      { name: "Mar", value: 180 },
      { name: "Apr", value: 200 },
      { name: "May", value: 450 },
      { name: "Jun", value: 321 },
      { name: "Jul", value: 234 },
      { name: "Aug", value: 432 },
      { name: "Sep", value: 210 },
      { name: "Oct", value: 340 },
      { name: "Nov", value: 287 },
      { name: "Dec", value: 400 },
    ];
  
    return (
      <div>
        <h2>Cr Tab</h2>
        <p>This is the content for the Criminal Profiling tab.</p>
        <h3>Example Line Chart</h3>
        <LineChart width={600} height={300} data={profilingData}>
          <XAxis dataKey="name" />
          <YAxis />
          <CartesianGrid stroke="#eee" />
          <Line type="monotone" dataKey="value" stroke="#8884d8" />
          <Tooltip />
          <Legend />
        </LineChart>
      </div>
    );
  };

  export {CriminalProfilingTabContent};