import React from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";

const VictimTabContent = () => {
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
  
    return (
      <div>
        <h2>Victim Tab</h2>
        <p>This is the content for the Victim tab.</p>
        <h3>Example Line Chart</h3>
        <LineChart width={600} height={300} data={victimData}>
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

  export {VictimTabContent};