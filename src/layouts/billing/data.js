import React from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";

// Victim Tab Content Component
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
      <h2>Criminal Profiling Tab</h2>
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

export { VictimTabContent, OffenderTabContent, CriminalProfilingTabContent };
