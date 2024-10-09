import * as React from "react";
import { useState } from "react";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Checkbox from "@mui/material/Checkbox";
import CssBaseline from "@mui/material/CssBaseline";
import FormControlLabel from "@mui/material/FormControlLabel";
import Divider from "@mui/material/Divider";
import FormLabel from "@mui/material/FormLabel";
import FormControl from "@mui/material/FormControl";
import Link from "@mui/material/Link";
import TextField from "@mui/material/TextField";
import Typography from "@mui/material/Typography";
import Stack from "@mui/material/Stack";
import MuiCard from "@mui/material/Card";
import { styled } from "@mui/material/styles";
import { GoogleIcon, FacebookIcon, LogoIcon } from "../CustomIcons";

import AppTheme from "../../../theme/AppTheme";
import ColorModeSelect from "../../../theme/ColorModeSelect";

const Card = styled(MuiCard)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",
  alignSelf: "center",
  width: "100%",
  padding: theme.spacing(4),
  gap: theme.spacing(2),
  margin: "auto",
  [theme.breakpoints.up("sm")]: {
    maxWidth: "450px",
  },
  boxShadow:
    "hsla(220, 30%, 5%, 0.05) 0px 5px 15px 0px, hsla(220, 25%, 10%, 0.05) 0px 15px 35px -5px",
  ...theme.applyStyles("dark", {
    boxShadow:
      "hsla(220, 30%, 5%, 0.5) 0px 5px 15px 0px, hsla(220, 25%, 10%, 0.08) 0px 15px 35px -5px",
  }),
}));

const SignUpContainer = styled(Stack)(({ theme }) => ({
  minHeight: "100%",
  padding: theme.spacing(2),
  [theme.breakpoints.up("sm")]: {
    padding: theme.spacing(4),
  },
  "&::before": {
    content: '""',
    display: "block",
    position: "absolute",
    zIndex: -1,
    inset: 0,
    backgroundImage:
      "radial-gradient(ellipse at 50% 50%, hsl(210, 100%, 97%), hsl(0, 0%, 100%))",
    backgroundRepeat: "no-repeat",
    ...theme.applyStyles("dark", {
      backgroundImage:
        "radial-gradient(at 50% 50%, hsla(210, 100%, 16%, 0.5), hsl(220, 30%, 5%))",
    }),
  },
}));

export default function SignUp(props) {
  const [emailError, setEmailError] = React.useState(false);
  const [emailErrorMessage, setEmailErrorMessage] = React.useState("");
  const [passwordError, setPasswordError] = React.useState(false);
  const [passwordErrorMessage, setPasswordErrorMessage] = React.useState("");
 
  const [nameError, setNameError] = React.useState(false); // or true/initial value
  const [nameErrorMessage, setNameErrorMessage] = React.useState("");
  const[userNameError, setUserNameError] = React.useState(false);
  const [successMessage, setSuccessMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [userNameErrorMessage, setUserNameErrorMessage] = useState("");
  const [formData, setFormData] = useState({
    first_name: '',
    last_name: '',
    email_address: '',
    username: '',
    password: '',
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };


  const handleSubmit = async (event) => {
    event.preventDefault();
    if (validateInputs()) {
      
      if (emailError || passwordError) {
     
        return;
      }
      const data = new FormData(event.currentTarget);
      console.log({
        email: data.get("email"),
        password: data.get("password"),
      });
      event.preventDefault();
      const mappedData = {
        first_name: formData.first_name,
        last_name: formData.last_name,
        email_address: formData.email_address,
        username: formData.username,
        password: formData.password
      };
    
      try {
        const response = await fetch('http://localhost:5000/api/customers/register', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(mappedData),  // Send the mapped data
        });
    
        const data = await response.json();
        console.log('Registration response:', data);

       
    
        if (!response.ok) {

          

        if (data.error.includes('Duplicate entry')) {
          // Set error message if username is duplicated
          setUserNameError(true);
          setUserNameErrorMessage('Username already exists. Please choose another username.');
        } else {
          throw new Error(`Error: ${response.status}`);
        }
      
        }
        else{
          setSuccessMessage('Registration successful! You can now login.');
          setErrorMessage('');
        }
    
       
      } catch (error) {
        
         
          setErrorMessage('An error occurred during registration. Please try again.');
               setSuccessMessage('');
      }
    }
  
    
  };

  const validateInputs = () => {
    

    let isValid = true;

   
    if (!formData.first_name || formData.first_name.length > 15) {
      setNameError(true);
      setNameErrorMessage("First name is invalid");
      isValid = false;
    } else {
      setNameError(false);
      setNameErrorMessage("");
    }

    if (!formData.last_name || formData.last_name.length > 15) {
      setNameError(true);
      setNameErrorMessage("Last name is invalid");
      isValid = false;
    } else {
      setNameError(false);
      setNameErrorMessage("");
    }

    if (!formData.email_address || !/\S+@\S+\.\S+/.test(formData.email_address)) {
      setEmailError(true);
      setEmailErrorMessage("Please enter a valid email address.");
      isValid = false;
    } else {
      setEmailError(false);
      setEmailErrorMessage("");
    }

    if (!formData.password || formData.password.length < 6) {
      setPasswordError(true);
      setPasswordErrorMessage("Password must be at least 6 characters long.");
      isValid = false;
    } else {
      setPasswordError(false);
      setPasswordErrorMessage("");
    }

    return isValid;
  };

  return (
    <AppTheme {...props}>
      <CssBaseline enableColorScheme />
      <SignUpContainer direction="column" justifyContent="space-between">
        <ColorModeSelect
          sx={{ position: "fixed", top: "1rem", right: "1rem" }}
        />
        <Card variant="outlined">
          <LogoIcon />
          <Typography
            component="h1"
            variant="h4"
            sx={{ width: "100%", fontSize: "clamp(2rem, 10vw, 2.15rem)" }}
          >
            Sign up
          </Typography>

          {errorMessage && (
            <Typography color="error" sx={{ mt: 2 }}>
              {errorMessage}
            </Typography>
          )}
          {successMessage && (
            <Typography color="success" sx={{ mt: 2 }}>
              {successMessage}
            </Typography>
          )}
          <Box
            component="form"
            onSubmit={handleSubmit}
            noValidate
            sx={{
              display: "flex",
              flexDirection: "column",
              width: "100%",
              gap: 2,
            }}
          >
            <FormControl>
              <FormLabel htmlFor="fname">First name</FormLabel>
              <TextField
                autoComplete="fname"
                name="first_name"
                required
                fullWidth
                id="fname"
                placeholder="Parakrama "
                value={formData.first_name}
                onChange={handleChange}
                error={nameError}
                helperText={nameErrorMessage}
                color={nameError ? "error" : "primary"}
              />
            </FormControl>
            <FormControl>
              <FormLabel htmlFor="lname">Last name</FormLabel>
              <TextField
                autoComplete="lname"
                name="last_name"
                required
                fullWidth
                id="lname"
                placeholder="Rathnayaka "
                value={formData.last_name}
                onChange={handleChange}
                error={nameError}
                helperText={nameErrorMessage}
                color={nameError ? "error" : "primary"}
              />
            </FormControl>
            <FormControl>
              <FormLabel htmlFor="email">Email</FormLabel>
              <TextField
                error={emailError}
                helperText={emailErrorMessage}
                id="email"
                type="email"
                name="email_address"
                placeholder="Parakramawork@email.com"
                value={formData.email_address}
                autoComplete="email"
                autoFocus
                required
                onChange={handleChange}
                fullWidth
                variant="outlined"
                color={emailError ? "error" : "primary"}
                sx={{ ariaLabel: "email" }}
              />
            </FormControl>
            <FormControl>
              <FormLabel htmlFor="username">Username</FormLabel>
              <TextField
                required
                fullWidth
                error={userNameError}
                helperText={userNameErrorMessage}
                name="username"
                placeholder="Parakrama"
                id="username"
                value={formData.username}
                autoComplete="username"
                variant="outlined"
                onChange={handleChange}
              
                color={nameError ? "error" : "primary"}/>
              </FormControl>
            <FormControl>
              <FormLabel htmlFor="password">Password</FormLabel>
              <TextField
                required
                fullWidth
                name="password"
                placeholder="••••••"
                type="password"
                id="password"
                value={formData.password}
                autoComplete="new-password"
                variant="outlined"
                onChange={handleChange}
                error={passwordError}
                helperText={passwordErrorMessage}
                color={passwordError ? "error" : "primary"}
              />
            </FormControl>
            <FormControlLabel
              control={<Checkbox value="remember" color="primary" />}
              label=" I want to receive updates via email."
            />

            <Button
              type="submit"
              fullWidth
              variant="contained"
              
            >
              Sign in
            </Button>
            <Typography sx={{ textAlign: "center" }}>
              Already have an account?{" "}
              <span>
                <Link
                  href="/signin"
                  variant="body2"
                  sx={{ alignSelf: "center" }}
                >
                  Sign in
                </Link>
              </span>
            </Typography>
          </Box>
          <Divider>or</Divider>
          <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
            <Button
              fullWidth
              variant="outlined"
              onClick={() => alert("Sign in with Google")}
              startIcon={<GoogleIcon />}
            >
              Sign up with Google
            </Button>
            <Button
              fullWidth
              variant="outlined"
              onClick={() => alert("Sign in with Facebook")}
              startIcon={<FacebookIcon />}
            >
              Sign up with Facebook
            </Button>
          </Box>
        </Card>
      </SignUpContainer>
    </AppTheme>
  );
}
