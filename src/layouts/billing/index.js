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
import { CriminalProfilingTabContent, OffenderTabContent, VictimTabContent } from "layouts/billing/data";
import { HotspotTabContent } from "./hotspot";
import { RecentTabContent } from "./recent";
import { TrendsTabContent } from "./trends";

// Data
import profilesListData from "layouts/profile/data/profilesListData";
import DefaultInfoCard from "examples/Cards/InfoCards/DefaultInfoCard";
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
import { Divider } from "@mui/material";

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
        return <TrendsTabContent />;
      case 1:
        return <HotspotTabContent />;
      case 2:
        return <RecentTabContent/>;
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
                  Statistics
                </ArgonTypography>
              </ArgonBox>
            </Grid>
            <Grid item xs={12} md={6} lg={4} sx={{ ml: "auto" }}>
              <AppBar position="static">
                <Tabs orientation={tabsOrientation} value={tabValue} onChange={handleSetTabValue}>
                  <Tab
                    label="Trends"
                    icon={<i className="ni ni-app" style={{ marginTop: "6px", marginRight: "8px" }} />}
                  />
                  <Tab
                    label="Hotspots"
                    icon={<i className="ni ni-email-83" style={{ marginTop: "6px", marginRight: "8px" }} />}
                  />
                  
                </Tabs>
              </AppBar>
            </Grid>
          </Grid>
        </Card>
      </ArgonBox>
      <Divider/>
      
            <Grid item xs={12} lg={8}>
              <Grid container spacing={3}>
                <Grid item xs={12} md={6} xl={3}>
                  <DefaultInfoCard
                    icon="local_police"
                    title="Theft"
                    description="+20% from last month"
                    value="290"
                  />
                </Grid>
                <Grid item xs={12} md={6} xl={3}>
                  <DefaultInfoCard
                    icon="local_police"
                    title="Assault"
                    description="+16% from last month"
                    value="143"
                  />
                </Grid>
                <Grid item xs={12} md={6} xl={3}>
                  <DefaultInfoCard
                    icon="local_police"
                    title="Burgulary"
                    description="-40% from last month"
                    value="455"
                  />
                </Grid>
                <Grid item xs={12} md={6} xl={3}>
                  <DefaultInfoCard
                    icon="local_police"
                    title="Gambling"
                    description="+60% from last month"
                    value="855.00"
                  />
                </Grid>
              </Grid>
            </Grid>
            <Divider/>
            {renderTabContent()}
      <Footer />
    </DashboardLayout>
  );
}

export default Overview;
