// @mui material components
import Card from "@mui/material/Card";
import Grid from "@mui/material/Grid";
import AppBar from "@mui/material/AppBar";
import Tabs from "@mui/material/Tabs";
import Tab from "@mui/material/Tab";

// @mui icons
import FacebookIcon from "@mui/icons-material/Facebook";
import TwitterIcon from "@mui/icons-material/Twitter";
import InstagramIcon from "@mui/icons-material/Instagram";

// Argon Dashboard 2 MUI components
import ArgonBox from "components/ArgonBox";
import ArgonTypography from "components/ArgonTypography";
import ArgonAvatar from "components/ArgonAvatar";

// Argon Dashboard 2 MUI example components
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import Footer from "examples/Footer";
import ProfileInfoCard from "examples/Cards/InfoCards/ProfileInfoCard";
import ProfilesList from "examples/Lists/ProfilesList";
import DefaultProjectCard from "examples/Cards/ProjectCards/DefaultProjectCard";
import PlaceholderCard from "examples/Cards/PlaceholderCard";
import PlatformSettings from "./components/PlatformSettings";
// import {OffenderTabContent, VictimTabContent } from "layouts/profile/data";
import { CriminalProfilingTabContent } from "./Criminal";
import { OffenderTabContent } from "./Offender";
import { VictimTabContent } from "./Victim";

// Data
import profilesListData from "layouts/profile/data/profilesListData";

// Images
import homeDecor1 from "assets/images/home-decor-1.jpg";
import homeDecor2 from "assets/images/home-decor-2.jpg";
import homeDecor3 from "assets/images/home-decor-3.jpg";
import team1 from "assets/images/team-1.jpg";
import team2 from "assets/images/team-2.jpg";
import team3 from "assets/images/team-3.jpg";
import team4 from "assets/images/team-4.jpg";
import burceMars from "assets/images/bruce-mars.jpg";
import { useState,useEffect} from "react";

function Overview() {
  const [tabsOrientation, setTabsOrientation] = useState("horizontal");
  const [tabValue, setTabValue] = useState(0);

  useEffect(() => {
    function handleTabsOrientation() {
      return window.innerWidth < 400
        ? setTabsOrientation("vertical")
        : setTabsOrientation("horizontal");
    }

    window.addEventListener("resize", handleTabsOrientation);
    handleTabsOrientation();

    return () => window.removeEventListener("resize", handleTabsOrientation);
  }, []);

  const handleSetTabValue = (event, newValue) => setTabValue(newValue);

  const renderTabContent = () => {
    switch (tabValue) {
      case 0:
        return <VictimTabContent />;
      case 1:
        return <OffenderTabContent />;
      default:
        return null;
    }
  };

  return (
    <DashboardLayout>
      <ArgonBox position="relative">
        <Card
          sx={{
            py: 2,
            px: 2,
            boxShadow: ({ boxShadows: { md } }) => md,
          }}
        >
          <Grid container spacing={3} alignItems="center">
            <Grid item>
              <ArgonBox height="100%" mt={0.5} lineHeight={1}>
                <ArgonTypography variant="h5" fontWeight="medium">
                  Demographics
                </ArgonTypography>
              </ArgonBox>
            </Grid>
            <Grid item xs={12} md={6} lg={4} sx={{ ml: "auto" }}>
              <AppBar position="static">
                <Tabs orientation={tabsOrientation} value={tabValue} onChange={handleSetTabValue}>
                  <Tab
                    label="Victim"
                    icon={<i className="ni ni-app" style={{ marginTop: "6px", marginRight: "8px" }} />}
                  />
                  <Tab
                    label="Offender"
                    icon={<i className="ni ni-email-83" style={{ marginTop: "6px", marginRight: "8px" }} />}
                  />
                </Tabs>
              </AppBar>
            </Grid>
          </Grid>
        </Card>
      </ArgonBox>

      
      
      {renderTabContent()}

      <Footer />
    </DashboardLayout>
  );
}

export default Overview;
