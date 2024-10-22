import React, { useState } from "react";
import {
  Container,
  Grid,
  Typography,
  TextField,
  Button,
  IconButton,
  Link,
  MenuItem,
  Select,
  FormControl,
  InputLabel,
  Box,
  Divider,
  Tooltip,
  Snackbar,
  Paper,
  useMediaQuery,
} from "@mui/material";
import {
  Facebook,
  Twitter,
  Instagram,
  YouTube,
  Send,
  Language,
  CreditCard,
  LocalShipping,
  Security,
} from "@mui/icons-material";
import { createTheme, ThemeProvider } from "@mui/material/styles";

const theme = createTheme({
  palette: {
    mode: "light",
    primary: {
      main: "#1976d2",
    },
    secondary: {
      main: "#f50057",
    },
  },
  typography: {
    fontFamily: '"Roboto", "Helvetica", "Arial", sans-serif',
    h6: {
      fontWeight: 600,
    },
  },
  components: {
    MuiButton: {
      styleOverrides: {
        root: {
          borderRadius: 20,
        },
      },
    },
  },
});

const footerSections = [
  {
    title: "Shop",
    links: [
      "Deals",
      "Best Sellers",
      "New Releases",
      "Gift Ideas",
      "Customer Service",
    ],
  },
  {
    title: "Sell",
    links: [
      "Start Selling",
      "How to Sell",
      "Business Accounts",
      "Affiliate Program",
    ],
  },
  {
    title: "About",
    links: ["About Us", "Careers", "Press Center", "Investor Relations"],
  },
  {
    title: "Help",
    links: ["Payments", "Shipping", "Returns & Replacements", "Contact Us"],
  },
];

const languages = [
  "English",
  "Español",
  "Français",
  "Deutsch",
  "日本語",
  "中文",
];

const Footer = () => {
  const [email, setEmail] = useState("");
  const [language, setLanguage] = useState("English");
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const isMobile = useMediaQuery(theme.breakpoints.down("sm"));

  const handleSubscribe = (e) => {
    e.preventDefault();
    if (email) {
      setSnackbarOpen(true);
      setEmail("");
    }
  };

  const handleCloseSnackbar = (event, reason) => {
    if (reason === "clickaway") {
      return;
    }
    setSnackbarOpen(false);
  };

  return (
    <ThemeProvider theme={theme}>
      <Paper elevation={3} sx={{ mt: 5 }}>
        <Box
          component="footer"
          sx={{ backgroundColor: "background.paper", py: 6 }}
        >
          <Container maxWidth="lg">
            <Grid container spacing={4} justifyContent="space-evenly">
              {footerSections.map((section) => (
                <Grid item xs={12} sm={6} md={3} key={section.title}>
                  <Typography variant="h6" color="primary" gutterBottom>
                    {section.title}
                  </Typography>
                  <ul style={{ listStyle: "none", padding: 0 }}>
                    {section.links.map((link) => (
                      <li key={link}>
                        <Link
                          href="#"
                          variant="body2"
                          color="text.secondary"
                          sx={{
                            "&:hover": {
                              color: "primary.main",
                              textDecoration: "none",
                            },
                            display: "inline-block",
                            my: 0.5,
                          }}
                        >
                          {link}
                        </Link>
                      </li>
                    ))}
                  </ul>
                </Grid>
              ))}
              <Grid item xs={12} sm={6} md={3}>
                <Typography variant="h6" color="primary" gutterBottom>
                  Stay Updated
                </Typography>
                <form onSubmit={handleSubscribe}>
                  <TextField
                    label="Your email"
                    variant="outlined"
                    fullWidth
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    margin="normal"
                    size="small"
                  />
                  <Button
                    type="submit"
                    variant="contained"
                    color="secondary"
                    endIcon={<Send />}
                    sx={{ mt: 1, width: "100%" }}
                  >
                    Subscribe
                  </Button>
                </form>
              </Grid>
            </Grid>

            <Divider sx={{ my: 4 }} />

            <Grid
              container
              justifyContent="space-between"
              alignItems="center"
              spacing={2}
            >
              <Grid item xs={12} md={4}>
                <Box
                  display="flex"
                  justifyContent={isMobile ? "center" : "flex-start"}
                >
                  <Tooltip title="Secure Payments">
                    <IconButton color="primary">
                      <CreditCard />
                    </IconButton>
                  </Tooltip>
                  <Tooltip title="Fast Shipping">
                    <IconButton color="primary">
                      <LocalShipping />
                    </IconButton>
                  </Tooltip>
                  <Tooltip title="Safe & Secure">
                    <IconButton color="primary">
                      <Security />
                    </IconButton>
                  </Tooltip>
                </Box>
              </Grid>
              <Grid item xs={12} md={4}>
                <Box display="flex" justifyContent="center" alignItems="center">
                  <Language color="action" sx={{ mr: 1 }} />
                  <FormControl variant="outlined" size="small">
                    <InputLabel>Language</InputLabel>
                    <Select
                      value={language}
                      onChange={(e) => setLanguage(e.target.value)}
                      label="Language"
                    >
                      {languages.map((lang) => (
                        <MenuItem key={lang} value={lang}>
                          {lang}
                        </MenuItem>
                      ))}
                    </Select>
                  </FormControl>
                </Box>
              </Grid>
              <Grid item xs={12} md={4}>
                <Box
                  display="flex"
                  justifyContent={isMobile ? "center" : "flex-end"}
                >
                  <IconButton color="primary" aria-label="Facebook">
                    <Facebook />
                  </IconButton>
                  <IconButton color="primary" aria-label="Twitter">
                    <Twitter />
                  </IconButton>
                  <IconButton color="primary" aria-label="Instagram">
                    <Instagram />
                  </IconButton>
                  <IconButton color="primary" aria-label="YouTube">
                    <YouTube />
                  </IconButton>
                </Box>
              </Grid>
            </Grid>

            <Typography
              variant="body2"
              color="text.secondary"
              align="center"
              sx={{ mt: 3 }}
            >
              © {new Date().getFullYear()} Your E-commerce Store. All rights
              reserved.
            </Typography>
          </Container>
        </Box>
      </Paper>
      <Snackbar
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center",
        }}
        open={snackbarOpen}
        autoHideDuration={6000}
        onClose={handleCloseSnackbar}
        message="Thanks for subscribing!"
        action={
          <Button color="secondary" size="small" onClick={handleCloseSnackbar}>
            Close
          </Button>
        }
      />
    </ThemeProvider>
  );
};

export default Footer;
