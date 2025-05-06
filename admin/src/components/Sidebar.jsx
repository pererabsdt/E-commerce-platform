import React, { useState } from "react";
import PropTypes from "prop-types";
import { Link, useLocation, useNavigate } from "react-router-dom";
import {
  Drawer,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Avatar,
  Typography,
  Divider,
  Box,
  ListItemButton,
  Tooltip,
  IconButton,
} from "@mui/material";
import {
  Category as CategoryIcon,
  ShoppingCart as ShoppingCartIcon,
  Assessment as AssessmentIcon,
  Home as HomeIcon,
  Logout as LogoutIcon,
  Menu as MenuIcon,
  Brightness4 as Brightness4Icon,
  Brightness7 as Brightness7Icon,
} from "@mui/icons-material";
import { styled, useTheme } from "@mui/material/styles";

const drawerWidth = 280;
const collapsedWidth = 60;

const menuItems = [
  { path: "/home", icon: <HomeIcon />, label: "Home" },
  { path: "/categories", icon: <CategoryIcon />, label: "Categories" },
  { path: "/products", icon: <ShoppingCartIcon />, label: "Products" },
  { path: "/sales-report", icon: <AssessmentIcon />, label: "Sales Report" },
];

const StyledDrawer = styled(Drawer)(({ theme, open }) => ({
  width: open ? drawerWidth : collapsedWidth,
  flexShrink: 0,
  whiteSpace: "nowrap",
  transition: theme.transitions.create("width", {
    easing: theme.transitions.easing.sharp,
    duration: theme.transitions.duration.enteringScreen,
  }),
  "& .MuiDrawer-paper": {
    width: open ? drawerWidth : collapsedWidth,
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
    overflowX: "hidden",
    background: theme.palette.background.paper,
    boxShadow: "2px 0 12px rgba(0,0,0,0.1)",
  },
}));

const ToggleButton = styled(IconButton)(({ theme }) => ({
  position: "absolute",
  top: theme.spacing(2),
  right: -theme.spacing(4),
  backgroundColor: theme.palette.background.paper,
  boxShadow: theme.shadows[3],
  "&:hover": {
    backgroundColor: theme.palette.background.paper,
  },
}));

export default function Sidebar() {
  const userName = localStorage.getItem("Name");
  const navigate = useNavigate();
  const location = useLocation();
  const theme = useTheme();
  const [open, setOpen] = useState(true);
  const [darkMode, setDarkMode] = useState(false);

  const handleLogout = async () => {
    try {
      // Clear all auth-related data
      ["token", "Name", "customerId"].forEach((key) =>
        localStorage.removeItem(key)
      );

      navigate("/signin", { replace: true });
    } catch (error) {
      console.error("Logout failed:", error);
    }
  };

  const toggleDrawer = () => {
    setOpen(!open);
  };

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    // Implement dark mode toggle logic here
  };

  return (
    <StyledDrawer variant="permanent" open={open}>
      <Box
        sx={{
          display: "flex",
          flexDirection: "column",
          height: "100%",
          position: "relative",
        }}
      >
        <ToggleButton onClick={toggleDrawer}>
          <MenuIcon />
        </ToggleButton>

        <Box
          sx={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            padding: open ? 4 : 2,
            transition: theme.transitions.create(["padding"], {
              duration: theme.transitions.duration.standard,
            }),
            backgroundColor: theme.palette.grey[100],
          }}
        >
          <Tooltip title={open ? "" : "User"} placement="right">
            <Avatar
              sx={{
                width: open ? 80 : 40,
                height: open ? 80 : 40,
                mb: open ? 2 : 0,
                bgcolor: theme.palette.secondary.main,
                fontSize: open ? "2rem" : "1.2rem",
                boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                border: `3px solid ${theme.palette.background.paper}`,
                transition: theme.transitions.create(
                  ["width", "height", "fontSize"],
                  {
                    duration: theme.transitions.duration.standard,
                  }
                ),
              }}
            >
              {userName?.[0]?.toUpperCase() || "A"}
            </Avatar>
          </Tooltip>
          {open && (
            <Typography
              variant="h6"
              sx={{
                fontWeight: 700,
                color: theme.palette.text.primary,
                textAlign: "center",
                transition: theme.transitions.create(["opacity"], {
                  duration: theme.transitions.duration.standard,
                }),
              }}
            >
              {"Bashitha"}
            </Typography>
          )}
        </Box>

        <Divider sx={{ borderColor: theme.palette.divider }} />

        <List component="nav" sx={{ flexGrow: 1, mt: 2 }}>
          {menuItems.map(({ path, icon, label }) => (
            <Tooltip key={path} title={open ? "" : label} placement="right">
              <ListItem disablePadding>
                <ListItemButton
                  component={Link}
                  to={path}
                  selected={location.pathname === path}
                  sx={{
                    minHeight: 48,
                    justifyContent: open ? "initial" : "center",
                    px: 2.5,
                    transition: theme.transitions.create(
                      ["background", "transform"],
                      {
                        duration: theme.transitions.duration.short,
                      }
                    ),
                    "&.Mui-selected": {
                      backgroundColor: theme.palette.primary.light,
                      color: theme.palette.primary.main,
                      "& .MuiListItemIcon-root": {
                        color: theme.palette.primary.main,
                      },
                      "&:hover": {
                        backgroundColor: theme.palette.primary.light,
                      },
                    },
                    "&:hover": {
                      backgroundColor: theme.palette.action.hover,
                      transform: "translateX(4px)",
                    },
                  }}
                >
                  <ListItemIcon
                    sx={{
                      minWidth: 0,
                      mr: open ? 3 : "auto",
                      justifyContent: "center",
                      color: theme.palette.text.secondary,
                      transition: theme.transitions.create("color", {
                        duration: theme.transitions.duration.short,
                      }),
                    }}
                  >
                    {icon}
                  </ListItemIcon>
                  {open && (
                    <ListItemText
                      primary={label}
                      sx={{
                        opacity: open ? 1 : 0,
                        transition: theme.transitions.create("opacity", {
                          duration: theme.transitions.duration.short,
                        }),
                        "& .MuiTypography-root": {
                          fontWeight: 500,
                          color: theme.palette.text.primary,
                        },
                      }}
                    />
                  )}
                </ListItemButton>
              </ListItem>
            </Tooltip>
          ))}
        </List>

        <Divider sx={{ borderColor: theme.palette.divider }} />

        <List sx={{ px: 2, pb: 3, pt: 2 }}>
          <Tooltip title={open ? "" : "Toggle Dark Mode"} placement="right">
            <ListItem disablePadding>
              <ListItemButton
                onClick={toggleDarkMode}
                sx={{
                  borderRadius: 2,
                  py: 1.5,
                  color: theme.palette.text.primary,
                  "&:hover": {
                    backgroundColor: theme.palette.action.hover,
                    transform: "translateX(4px)",
                  },
                }}
              >
                <ListItemIcon sx={{ minWidth: 0, mr: open ? 3 : "auto" }}>
                  {darkMode ? <Brightness7Icon /> : <Brightness4Icon />}
                </ListItemIcon>
                {open && (
                  <ListItemText
                    primary="Toggle Theme"
                    sx={{
                      "& .MuiTypography-root": {
                        fontWeight: 500,
                        color: theme.palette.text.primary,
                      },
                    }}
                  />
                )}
              </ListItemButton>
            </ListItem>
          </Tooltip>

          <Tooltip title={open ? "" : "Logout"} placement="right">
            <ListItem disablePadding>
              <ListItemButton
                onClick={handleLogout}
                sx={{
                  borderRadius: 2,
                  py: 1.5,
                  color: theme.palette.error.main,
                  "&:hover": {
                    backgroundColor: theme.palette.error.light,
                    transform: "translateX(4px)",
                  },
                }}
              >
                <ListItemIcon
                  sx={{ minWidth: 0, mr: open ? 3 : "auto", color: "inherit" }}
                >
                  <LogoutIcon />
                </ListItemIcon>
                {open && (
                  <ListItemText
                    primary="Logout"
                    sx={{
                      "& .MuiTypography-root": {
                        fontWeight: 500,
                        color: theme.palette.text.primary,
                      },
                    }}
                  />
                )}
              </ListItemButton>
            </ListItem>
          </Tooltip>
        </List>
      </Box>
    </StyledDrawer>
  );
}

Sidebar.propTypes = {
  userName: PropTypes.string,
};
