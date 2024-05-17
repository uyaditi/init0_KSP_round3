
// @mui material components
import Link from "@mui/material/Link";

// Argon Dashboard 2 MUI components

import ArgonBox from "components/ArgonBox";

// Argon Dashboard 2 MUI context
import { useArgonController } from "context";


function SidenavFooter() {
  const [controller] = useArgonController();
  const { miniSidenav, darkSidenav } = controller;

  return (
    <ArgonBox opacity={miniSidenav ? 0 : 1} sx={{ transition: "opacity 200ms linear" }}>
    </ArgonBox>
  );
}

export default SidenavFooter;
