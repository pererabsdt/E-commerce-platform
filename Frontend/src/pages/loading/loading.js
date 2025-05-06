import React from "react";
import { CircularProgress, Box, Typography } from "@mui/material";
import { keyframes } from "@emotion/react";

const fadeIn = keyframes`
  0% { opacity: 0; }
  100% { opacity: 1; }
`;

const LoadingPage = ({ message = "Loading, please wait..." }) => {
  return (
    <Box
      sx={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        height: "100vh",
        backgroundColor: "#f0f2f5",
        animation: `${fadeIn} 0.5s ease-in-out`,
      }}
    >
      <CircularProgress
        color="primary"
        size={60}
        thickness={4.5}
        sx={{
          marginBottom: 2,
          animation: "spin 1s linear infinite",
        }}
      />
      <Typography
        variant="h6"
        sx={{
          color: "#555", // Softer text color
          fontWeight: 500,
          letterSpacing: "0.5px",
          animation: `${fadeIn} 1s ease-in-out`,
        }}
      >
        {message}
      </Typography>
    </Box>
  );
};

export default LoadingPage;
