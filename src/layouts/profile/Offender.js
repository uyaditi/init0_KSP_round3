import React from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";


// Offender Tab Content Component
const OffenderTabContent = () => {
    // Example data for Offender tab
    const offenderData = [
      { name: "Jan", value: 240 },
      { name: "Feb", value: 456 },
      { name: "Mar", value: 300 },
      { name: "Apr", value: 312 },
      { name: "May", value: 555 },
      { name: "Jun", value: 211 },
      { name: "Jul", value: 433 },
      { name: "Aug", value: 123 },
      { name: "Sep", value: 400 },
      { name: "Oct", value: 345 },
      { name: "Nov", value: 567 },
      { name: "Dec", value: 200 },
    ];
  
    return (
      <div>
        <h2>Offender Tab</h2>
        <p>This is the content for the Offender tab.</p>
        <h3>Example Line Chart</h3>
        <LineChart width={600} height={300} data={offenderData}>
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

  export {OffenderTabContent};