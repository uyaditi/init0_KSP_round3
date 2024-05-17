import { useState } from "react";
import Grid from "@mui/material/Grid";
import Card from "@mui/material/Card";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import TextField from "@mui/material/TextField";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import IconButton from "@mui/material/IconButton";
import AddIcon from "@mui/icons-material/Add";
import MoreVertIcon from "@mui/icons-material/MoreVert";
import Menu from "@mui/material/Menu";
import MenuItem from "@mui/material/MenuItem";
import ArgonTypography from "components/ArgonTypography";

function AlertsDisplay() {
  const [alerts, setAlerts] = useState([]);
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [dateFrom, setDateFrom] = useState("");
  const [dateTo, setDateTo] = useState("");
  const [anchorEl, setAnchorEl] = useState(null);
  const [selectedAlert, setSelectedAlert] = useState(null);

  const handleAddAlert = () => {
    setOpen(true);
  };

  const handleSaveAlert = () => {
    const newAlert = {
      title,
      description,
      dateFrom,
      dateTo
    };
    setAlerts([...alerts, newAlert]);
    setOpen(false);
    setTitle("");
    setDescription("");
    setDateFrom("");
    setDateTo("");
  };

  const handleViewEdit = (alert) => {
    setSelectedAlert(alert);
    setAnchorEl(null);
    setOpen(true);
    setTitle(alert.title);
    setDescription(alert.description);
    setDateFrom(alert.dateFrom);
    setDateTo(alert.dateTo);
  };

  return (
    <Grid item xs={12} md={12}>
      <Card>
        <Typography variant="h6" component="h2" align="center" xs={12} gutterBottom>
          Alerts
        </Typography>
        <ul style={{ listStyleType: "none", padding: 0 }}>
          {alerts.map((alert, index) => (
            <li key={index} style={{ marginBottom: "16px", borderBottom: "1px solid #ddd", paddingBottom: "8px" }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <ArgonTypography variant="h6">{alert.title}</ArgonTypography>
                <div>
                  <IconButton onClick={(event) => { setAnchorEl(event.currentTarget); setSelectedAlert(alert); }}>
                    <MoreVertIcon />
                  </IconButton>
                  <Menu
                    id="menu"
                    anchorEl={anchorEl}
                    open={Boolean(anchorEl)}
                    onClose={() => setAnchorEl(null)}
                  >
                    <MenuItem onClick={() => handleViewEdit(selectedAlert)}>View/Edit</MenuItem>
                  </Menu>
                </div>
              </div>
            </li>
          ))}
        </ul>
        <Button
          variant="contained"
          color="primary"
          onClick={handleAddAlert}
          startIcon={<AddIcon />}
        >
          Add New Alert
        </Button>
      </Card>

      <Dialog open={open} onClose={() => setOpen(false)}>
        <DialogTitle>{selectedAlert ? "Edit Alert" : "Add New Alert"}</DialogTitle>
        <DialogContent>
          <DialogContentText>Please fill out the form</DialogContentText>
          <TextField
            autoFocus
            margin="dense"
            label="Title"
            type="text"
            fullWidth
            value={title}
            onChange={(e) => setTitle(e.target.value)}
          />
          <TextField
            margin="dense"
            label="Description"
            type="text"
            fullWidth
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />
          <TextField
            margin="dense"
            label="Date From"
            type="date"
            fullWidth
            value={dateFrom}
            onChange={(e) => setDateFrom(e.target.value)}
            InputLabelProps={{
              shrink: true
            }}
          />
          <TextField
            margin="dense"
            label="Date To"
            type="date"
            fullWidth
            value={dateTo}
            onChange={(e) => setDateTo(e.target.value)}
            InputLabelProps={{
              shrink: true
            }}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpen(false)}>Cancel</Button>
          <Button onClick={handleSaveAlert}>Save</Button>
        </DialogActions>
      </Dialog>
    </Grid>
  );
}

export default AlertsDisplay;
