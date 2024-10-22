import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
    Box, 
    Typography, 
    Button, 
    Stack, 
    Fade 
} from '@mui/material';
import HomeIcon from '@mui/icons-material/Home';
import DashboardIcon from '@mui/icons-material/Dashboard';
import SentimentDissatisfiedIcon from '@mui/icons-material/SentimentDissatisfied';

function NotFound() {
    const navigate = useNavigate();
    const [countdown, setCountdown] = useState(10); // Countdown starts at 10 seconds

    useEffect(() => {
        if (countdown === 0) {
            navigate('/'); // Redirect to the home page when countdown reaches zero
        }

        const timer = setTimeout(() => {
            setCountdown(prev => prev - 1);
        }, 1000);

        return () => clearTimeout(timer);
    }, [countdown, navigate]);

    const handleRedirectDashboard = () => {
        navigate('/home'); // Redirect to the dashboard page
    };

    const handleGoBack = () => {
        navigate(-1); // Navigate back to the previous page
    };

    return (
        <Fade in={true} timeout={1000}>
            <Box
                sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                    height: '100vh',
                    background: 'linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%)',
                    textAlign: 'center',
                    padding: 2,
                }}
            >
                <SentimentDissatisfiedIcon 
                    sx={{ 
                        fontSize: 100, 
                        color: '#3f51b5', 
                        mb: 2, 
                        animation: 'bounce 2s infinite' 
                    }} 
                />
                <Typography variant="h3" component="h1" color="#333" gutterBottom>
                    Oops! Page Not Found
                </Typography>
                <Typography variant="h6" color="#555" gutterBottom>
                    The page you're looking for doesn't exist.
                </Typography>
                <Typography variant="body1" color="#777" gutterBottom>
                    Redirecting to Home in {countdown} second{countdown !== 1 ? 's' : ''}...
                </Typography>
                <Stack direction="row" spacing={2} mt={4}>
                    <Button
                        variant="contained"
                        color="primary"
                        startIcon={<DashboardIcon />}
                        onClick={handleRedirectDashboard}
                        size="large"
                        sx={{
                            paddingX: 4,
                            paddingY: 1.5,
                            textTransform: 'none',
                            boxShadow: 3,
                            '&:hover': {
                                boxShadow: 6,
                                transform: 'scale(1.05)',
                                transition: 'transform 0.3s, box-shadow 0.3s',
                            },
                        }}
                    >
                        Go to Dashboard
                    </Button>
                    <Button
                        variant="outlined"
                        color="primary"
                        startIcon={<HomeIcon />}
                        onClick={handleGoBack}
                        size="large"
                        sx={{
                            paddingX: 4,
                            paddingY: 1.5,
                            textTransform: 'none',
                            borderColor: '#3f51b5',
                            color: '#3f51b5',
                            boxShadow: 3,
                            '&:hover': {
                                boxShadow: 6,
                                borderColor: '#3f51b5',
                                transform: 'scale(1.05)',
                                transition: 'transform 0.3s, box-shadow 0.3s',
                            },
                        }}
                    >
                        Go Back
                    </Button>
                </Stack>
                {/* CSS for Bounce Animation */}
                <style>
                    {`
                        @keyframes bounce {
                            0%, 20%, 50%, 80%, 100% {
                                transform: translateY(0);
                            }
                            40% {
                                transform: translateY(-20px);
                            }
                            60% {
                                transform: translateY(-10px);
                            }
                        }
                    `}
                </style>
            </Box>
        </Fade>
    );
}

export default NotFound;