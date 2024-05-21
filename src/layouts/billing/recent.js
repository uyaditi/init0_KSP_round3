// import ArgonTypography from "components/ArgonTypography";
// import React from "react";
// import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";
// import Invoices from "./components/Invoices";
// import ArgonBox from "components/ArgonBox";
// import Transactions from "./components/Transactions";
// import { Grid, Slider, Table } from "@mui/material";
// import DefaultInfoCard from "examples/Cards/InfoCards/DefaultInfoCard";
// import authorsTableData from "layouts/tables/data/authorsTableData";
// import {Card} from "@mui/material";

// // Victim Tab Content Component
// const RecentTabContent = () => {
//     const { columns, rows } = authorsTableData;
//     // Example data for Victim tab
//     const victimData = [
//       { name: "Jan", value: 400 },
//       { name: "Feb", value: 300 },
//       { name: "Mar", value: 200 },
//       { name: "Apr", value: 278 },
//       { name: "May", value: 189 },
//       { name: "Jun", value: 239 },
//       { name: "Jul", value: 349 },
//       { name: "Aug", value: 230 },
//       { name: "Sep", value: 400 },
//       { name: "Oct", value: 500 },
//       { name: "Nov", value: 390 },
//       { name: "Dec", value: 600 },
//     ];
  
//     return (

//       // <div>
//       //   <Grid>
//       //     <Grid><ArgonTypography><Invoices/></ArgonTypography></Grid>
//       //     <Grid><ArgonTypography><Transactions/></ArgonTypography></Grid>
//       //   </Grid>
//       //   <h2>Recent Tab</h2>
//       //   <p>This is the content for the Victim tab.</p>
//       //   <h3>Example Line Chart</h3>
//       //   <LineChart width={600} height={300} data={victimData}>
//       //     <XAxis dataKey="name" />
//       //     <YAxis />
//       //     <CartesianGrid stroke="#eee" />
//       //     <Line type="monotone" dataKey="value" stroke="#8884d8" />
//       //     <Tooltip />
//       //     <Legend />
//       //   </LineChart>

// <Grid container spacing={10}>
//       <Grid item xs={12} md={6} xl={6}> {/* Adjust size based on your layout needs */}
//         {/* <Invoices /> */}
//         <ArgonBox mb={3}>
//           <Card>
//             <ArgonBox display="flex" justifyContent="space-between" alignItems="center" p={3}>
//               <ArgonTypography variant="h6">Authors table</ArgonTypography>
//             </ArgonBox>
//             <Slider/>
//             <ArgonBox
//               sx={{
//                 "& .MuiTableRow-root:not(:last-child)": {
//                   "& td": {
//                     borderBottom: ({ borders: { borderWidth, borderColor } }) =>
//                       `${borderWidth[1]} solid ${borderColor}`,
//                   },
//                 },
//               }}
//             >
//               <Table columns={columns} rows={rows} />
//             </ArgonBox>
//           </Card>
//         </ArgonBox>
//       </Grid>
//       <Grid item xs={12} md={6} xl={6}> {/* Adjust size based on your layout needs */}
//         <Transactions />
//       </Grid>
//     </Grid>
//       // </div>
    
//     );
//   };

//   export {RecentTabContent}



// @mui material components
import Card from "@mui/material/Card";
import Grid from "@mui/material/Grid";
import Slider from "layouts/tables/data";

// Argon Dashboard 2 MUI components
import ArgonBox from "components/ArgonBox";
import ArgonTypography from "components/ArgonTypography";

// Argon Dashboard 2 MUI examples
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import DashboardNavbar from "examples/Navbars/DashboardNavbar";
import Footer from "examples/Footer";
import Table from "examples/Tables/Table";

// Data
import authorsTableData from "layouts/tables/data/authorsTableData";
import projectsTableData from "layouts/tables/data/projectsTableData";

function RecentTabContent() {
  const { columns, rows } = authorsTableData;
  const { columns: prCols, rows: prRows } = projectsTableData;

  return (
      <ArgonBox py={3}>
        <ArgonBox mb={3}>
          <Card>
            <ArgonBox display="flex" justifyContent="space-between" alignItems="center" p={3}>
              <ArgonTypography variant="h6">Recent Crimes</ArgonTypography>
            </ArgonBox>
            <Slider/>
            <ArgonBox
              sx={{
                "& .MuiTableRow-root:not(:last-child)": {
                  "& td": {
                    borderBottom: ({ borders: { borderWidth, borderColor } }) =>
                      `${borderWidth[1]} solid ${borderColor}`,
                  },
                },
              }}
            >
              <Table columns={columns} rows={rows} />
            </ArgonBox>
          </Card>
        </ArgonBox>
        
      </ArgonBox>

  );
}

export {RecentTabContent};
