
// Argon Dashboard 2 MUI components
import ArgonTypography from "components/ArgonTypography";

const categoriesListData = [
  {
    color: "dark",
    icon: <i className="ni ni-delivery-fast" style={{ fontSize: "12px" }} />,
    name: "Traffic",
    description: (
      <>
        12 are active,{" "}
        <ArgonTypography variant="caption" color="text" fontWeight="medium">
          80 closed
        </ArgonTypography>
      </>
    ),
  },
  {
    color: "dark",
    icon: <i className="ni ni-active-40" style={{ fontSize: "12px" }} />,
    name: "Blackmailing",
    description: (
      <>
        0 active,{" "}
        <ArgonTypography variant="caption" color="text" fontWeight="medium">
          55 closed
        </ArgonTypography>
      </>
    ),
  },
  {
    color: "dark",
    icon: <i className="ni ni-single-02" style={{ fontSize: "12px" }} />,
    name: "Crime Against Women",
    description: (
      <>
        1 is active,{" "}
        <ArgonTypography variant="caption" color="text" fontWeight="medium">
          40 closed
        </ArgonTypography>
      </>
    ),
  },
  {
    color: "dark",
    icon: <i className="ni ni-circle-08" style={{ fontSize: "12px" }} />,
    name: "Crime Against children",
    description: (
      <>
        12 are active,{" "}
        <ArgonTypography variant="caption" color="text" fontWeight="medium">
          80 closed
        </ArgonTypography>
      </>
    ),
  },
];

export default categoriesListData;
