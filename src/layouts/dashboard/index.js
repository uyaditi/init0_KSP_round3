/* eslint-disable no-unused-vars */

// @mui material components
import Grid from "@mui/material/Grid";
import Icon from "@mui/material/Icon";

// Argon Dashboard 2 MUI components
import ArgonBox from "components/ArgonBox";
import ArgonTypography from "components/ArgonTypography";

// Argon Dashboard 2 MUI example components
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import DashboardNavbar from "examples/Navbars/DashboardNavbar";
import Footer from "examples/Footer";
import DetailedStatisticsCard from "examples/Cards/StatisticsCards/DetailedStatisticsCard";
import SalesTable from "examples/Tables/SalesTable";
import AlertsDisplay from "./alerts";
import CategoriesList from "examples/Lists/CategoriesList";
import GradientLineChart from "examples/Charts/LineCharts/GradientLineChart";


// Argon Dashboard 2 MUI base styles
import typography from "assets/theme/base/typography";

// Dashboard layout components
import Slider from "layouts/dashboard/components/Slider/index";
import Slider2 from "layouts/dashboard/components/Slider/new";

// Data
import gradientLineChartData from "layouts/dashboard/data/gradientLineChartData";
import salesTableData from "layouts/dashboard/data/salesTableData";
import categoriesListData from "layouts/dashboard/data/categoriesListData";

function Default() {
  const { size } = typography;
  return (
    <DashboardLayout>
      <DashboardNavbar />
      <ArgonBox py={3}>
        <Grid container spacing={3} mb={3}>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Police Cars"
              count="50"
              icon={{ color: "info", component: <i className="ni ni-bus-front-12" /> }}
              percentage={{ color: "error", count: "20", text: "In-use" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Police Bikes"
              count="30"
              icon={{ color: "info", component: <i className="ni ni-delivery-fast" /> }}
              percentage={{ color: "error", count: "15", text: "In-use" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Police Vans"
              count="15"
              icon={{ color: "info", component: <i className="ni ni-bus-front-12" /> }}
              percentage={{ color: "error", count: "5", text: "In-use" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Response Time"
              count="5"
              icon={{ color: "success", component: <i className="ni ni-time-alarm" /> }}
              percentage={{ color: "success", text: "minutes" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Open Investigations"
              count="20"
              icon={{ color: "error", component: <i className="ni ni-archive-2" /> }}
              percentage={{ color: "success", count: "-5", text: "since yesterday" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Officers"
              count="2,300"
              icon={{ color: "error", component: <i className="ni ni-circle-08" /> }}
              percentage={{ color: "success", count: "+3%", text: "since last week" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Training"
              count="140"
              icon={{ color: "dark", component: <i className="ni ni-paper-diploma" /> }}
              percentage={{ color: "success", count: "30", text: "completed last month" }}
            />
          </Grid>
          <Grid item xs={12} md={6} lg={3}>
            <DetailedStatisticsCard
              title="Community Engagements"
              count="1230"
              icon={{ color: "success", component: <i className="ni ni-cart" /> }}
              percentage={{ color: "success", count: "+5%", text: "posts than last month" }}
            />
          </Grid>
        </Grid>
        <Grid container spacing={3} mb={3}>
          <Grid item xs={12} lg={7}>
            <GradientLineChart
              title="Performance Over Time"
              description={
                <ArgonBox display="flex" alignItems="center">
                  <ArgonBox fontSize={size.lg} color="success" mb={0.3} mr={0.5} lineHeight={0}>
                    <Icon sx={{ fontWeight: "bold" }}>arrow_downward</Icon>
                  </ArgonBox>
                  <ArgonTypography variant="button" color="text" fontWeight="medium">
                    20% less{" "}
                    <ArgonTypography variant="button" color="text" fontWeight="regular">
                      Since Jan 2023
                    </ArgonTypography>
                  </ArgonTypography>
                </ArgonBox>
              }
              chart={gradientLineChartData}
            />
          </Grid>
          <Grid item xs={12} lg={5}>
            <Slider />
          </Grid>
          
        </Grid>
        <Grid container spacing={3}>
          <Grid item xs={12} md={4}>
            {/* <SalesTable title="Alerts" rows={salesTableData} /> */}
            <AlertsDisplay/>
          </Grid>
          <Grid item xs={12} md={4}>
            <CategoriesList title="Community Complaints" categories={categoriesListData} />
          </Grid >
          <Grid item xs={12} md={4}>
            <Slider2/>
          </Grid>
        </Grid>
      </ArgonBox>
      <Footer />
    </DashboardLayout>
  );
}

export default Default;
