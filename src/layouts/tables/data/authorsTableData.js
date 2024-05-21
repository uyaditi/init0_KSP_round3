/* eslint-disable react/prop-types */
// Argon Dashboard 2 MUI components
import ArgonBox from "components/ArgonBox";
import ArgonTypography from "components/ArgonTypography";
import ArgonAvatar from "components/ArgonAvatar";
import ArgonBadge from "components/ArgonBadge";

// Images
import suspect2 from "assets/images/suspect.png";
import suspect3 from "assets/images/suspect.png";
import suspect4 from "assets/images/suspect.png";

function Suspect({ image, name, email }) {
  return (
    <ArgonBox display="flex" alignItems="center" px={1} py={0.5}>
      <ArgonBox mr={2}>
        <ArgonAvatar src={image} alt={name} size="sm" variant="square" />
      </ArgonBox>
      <ArgonBox display="flex" flexDirection="column">
        <ArgonTypography variant="button" fontWeight="medium">
          {name}
        </ArgonTypography>
        <ArgonTypography variant="caption" color="secondary">
          {email}
        </ArgonTypography>
      </ArgonBox>
    </ArgonBox>
  );
}

function CrimeType({ type, category }) {
  return (
    <ArgonBox display="flex" flexDirection="column">
      <ArgonTypography variant="caption" fontWeight="medium" color="text">
        {type}
      </ArgonTypography>
      <ArgonTypography variant="caption" color="secondary">
        {category}
      </ArgonTypography>
    </ArgonBox>
  );
}

const crimesTableData = {
  columns: [
    { name: "Suspect Name", align: "left" },
    { name: "Crime Type", align: "left" },
    { name: "Investigation Status", align: "center" },
    { name: "Law Enforcement Involved", align: "center" },
    { name: "Legal Action Taken", align: "center" },
  ],

  rows: [
    {
      "Suspect Name": <Suspect image={suspect2} name="Ajay Kumar"/>,
      "Crime Type": <CrimeType type="Robbery" category="Felony" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Ongoing" color="warning" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          Local Police
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Suspect Arrested
        </ArgonTypography>
      ),
    },
    {
      "Suspect Name": <Suspect image={suspect3} name="Shreya Rao" email="" />,
      "Crime Type": <CrimeType type="Fraud" category="White-Collar" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Unsolved" color="error" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          Local Police
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Investigation Ongoing
        </ArgonTypography>
      ),
    },
    {
      "Suspect Name": <Suspect image={suspect4} name="Anand Gowda" email="" />,
      "Crime Type": <CrimeType type="Assault" category="Violent" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Solved" color="success" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          Local Police
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Convicted and Sentenced
        </ArgonTypography>
      ),
    },
    {
      "Suspect Name": <Suspect image={suspect3} name="Kavitha Reddy" email="" />,
      "Crime Type": <CrimeType type="Cybercrime" category="Technology" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Ongoing" color="warning" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          Cyber Division
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Search Warrant Issued
        </ArgonTypography>
      ),
    },
    {
      "Suspect Name": <Suspect image={suspect2} name="Sanjay Nair" email="" />,
      "Crime Type": <CrimeType type="Drug Trafficking" category="Narcotics" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Solved" color="success" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          NCB Division
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Arrested and Charges Filed
        </ArgonTypography>
      ),
    },
    {
      "Suspect Name": <Suspect image={suspect4} name="Meena Patel" email="" />,
      "Crime Type": <CrimeType type="Vandalism" category="Property" />,
      "Investigation Status": (
        <ArgonBadge variant="gradient" badgeContent="Unsolved" color="error" size="xs" container />
      ),
      "Law Enforcement Involved": (
        <ArgonTypography variant="caption" color="secondary" fontWeight="medium">
          Local Police
        </ArgonTypography>
      ),
      "Legal Action Taken": (
        <ArgonTypography
          component="a"
          href="#"
          variant="caption"
          color="secondary"
          fontWeight="medium"
        >
          Investigation Ongoing
        </ArgonTypography>
      ),
    },
  ],
};

export default crimesTableData;