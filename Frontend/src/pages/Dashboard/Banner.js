import React, { useState, useEffect, useRef, useCallback } from "react";
import {
  Button,
  Typography,
  Box,
  Container,
  Grid,
  Link,
  IconButton,
  useMediaQuery,
} from "@mui/material";
import { styled, alpha, useTheme } from "@mui/material/styles";
import ArrowForwardIcon from "@mui/icons-material/ArrowForward";
import ChevronLeftIcon from "@mui/icons-material/ChevronLeft";
import ChevronRightIcon from "@mui/icons-material/ChevronRight";
import PauseIcon from "@mui/icons-material/Pause";
import PlayArrowIcon from "@mui/icons-material/PlayArrow";
import { useSwipeable } from "react-swipeable";


// Importing specific background images
import ban1 from "../../assets/images/ban1.jpg";
import ban2 from "../../assets/images/ban2.jpg";
import ban3 from "../../assets/images/ban3.jpg";

// **Importing Local Images for Categories**
import tvImage from "../../assets/images/tv.jpg";
import carImage from "../../assets/images/car.jpg";
import bikeImage from "../../assets/images/bike.jpg";

// Styled Components
const BannerContainer = styled(Box)(({ theme }) => ({
  color: "white",
  padding: theme.spacing(4),
  position: "relative",
  borderRadius: theme.shape.borderRadius,
  overflow: "hidden",
  height: "500px",
  display: "flex",
  alignItems: "center",
  boxShadow: "0 4px 6px rgba(0, 0, 0, 0.1)",
  [theme.breakpoints.down("sm")]: {
    height: "450px",
    padding: theme.spacing(4),
  },
}));

const BackgroundImage = styled(Box)(({ theme, image }) => ({
  position: "absolute",
  top: 0,
  left: 0,
  right: 0,
  bottom: 0,
  backgroundImage: `linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(${image})`,
  backgroundSize: "cover",
  backgroundPosition: "center",
  transition: "opacity 0.5s ease-in-out",
  opacity: 0,
  zIndex: 0,
  borderRadius: theme.shape.borderRadius,
  "&.active": {
    opacity: 1,
  },
}));

const ContentWrapper = styled(Box)(({ theme }) => ({
  position: "relative",
  zIndex: 1,
  width: "100%",
  transition: "transform 0.5s ease-in-out",
  [theme.breakpoints.down("sm")]: {
    textAlign: "center",
  },
}));

const CategoryBox = styled(Box)(({ theme }) => ({
  backgroundColor: alpha(theme.palette.background.paper, 0.8),
  borderRadius: theme.shape.borderRadius,
  padding: theme.spacing(2),
  textAlign: "center",
  transition: "transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out",
  "&:hover": {
    transform: "scale(1.05)",
    boxShadow: theme.shadows[4],
  },
  [theme.breakpoints.down("sm")]: {
    padding: theme.spacing(1),
  },
}));

const ControlButton = styled(IconButton)(({ theme }) => ({
  color: "white",
  backgroundColor: alpha(theme.palette.common.black, 0.5),
  "&:hover": {
    backgroundColor: alpha(theme.palette.common.black, 0.7),
  },
  transition: "background-color 0.3s ease-in-out",
}));

const PaginationDots = styled(Box)(({ theme }) => ({
  position: "absolute",
  bottom: theme.spacing(2),
  left: "50%",
  transform: "translateX(-50%)",
  display: "flex",
  gap: theme.spacing(1),
}));

const Dot = styled(Box)(({ theme, active }) => ({
  width: 12,
  height: 12,
  borderRadius: "50%",
  backgroundColor: active
    ? theme.palette.primary.main
    : alpha(theme.palette.common.white, 0.5),
  cursor: "pointer",
  transition: "background-color 0.3s ease-in-out",
}));

// CategoryIcon styled component
const CategoryIcon = styled(Box)(({ theme }) => ({
  position: "absolute",
  top: 10,
  right: 10,
  backgroundColor: alpha(theme.palette.primary.main, 0.8),
  borderRadius: "50%",
  padding: theme.spacing(1),
  transition: "transform 0.3s ease, opacity 0.3s ease",
  opacity: 0,
  transform: "scale(1)",
}));

// Banner Component
const Banner = () => {
  const theme = useTheme();
  const isSmallScreen = useMediaQuery(theme.breakpoints.down("sm"));

  const [currentSlide, setCurrentSlide] = useState(0);
  const [isPlaying, setIsPlaying] = useState(true);
  const slideInterval = useRef(null);

  const slides = [
    {
      image: ban1,
      title: "Keep your vehicle in top form",
      subtitle: "Find maintenance parts for a smoother ride.",
    },
    {
      image: ban2,
      title: "Rev up your ride",
      subtitle: "Discover premium motorcycle parts and accessories.",
    },
    {
      image: ban3,
      title: "Conquer any terrain",
      subtitle: "Equip your ATV with the best parts and gear.",
    },
  ];

  // **Updated Categories with Local Images**
  const categories = [
    {
      name: "Car and Truck Parts",
      image: carImage,
    },
    {
      name: "Motorcycle Parts",
      image: bikeImage,
    },
    {
      name: "TV Parts",
      image: tvImage,
    },
  ];

  // Memoize handleNextSlide to prevent unnecessary re-creations
  const handleNextSlide = useCallback(() => {
    setCurrentSlide((prev) => (prev + 1) % slides.length);
  }, [slides.length]);

  // Auto Slide Effect
  useEffect(() => {
    if (isPlaying) {
      slideInterval.current = setInterval(() => {
        handleNextSlide();
      }, 5000);
    }
    return () => clearInterval(slideInterval.current);
  }, [isPlaying, handleNextSlide]);

  // Swipe Handlers
  const handlers = useSwipeable({
    onSwipedLeft: () => handleNextSlide(),
    onSwipedRight: () => handlePrevSlide(),
    preventDefaultTouchmoveEvent: true,
    trackMouse: true,
  });

  // Slide Handlers
  const handlePrevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + slides.length) % slides.length);
  };

  const togglePlayPause = () => {
    setIsPlaying((prev) => !prev);
  };

  // Pause on hover handlers
  const handleMouseEnter = () => {
    setIsPlaying(false);
  };

  const handleMouseLeave = () => {
    setIsPlaying(true);
  };

  return (
    <BannerContainer {...handlers} onMouseEnter={handleMouseEnter} onMouseLeave={handleMouseLeave}>
      {slides.map((slide, index) => (
        <BackgroundImage
          key={index}
          image={slide.image}
          className={currentSlide === index ? "active" : ""}
          role="img"
          aria-label={`Slide ${index + 1}`}
          loading="lazy"
        />
      ))}
      <Container maxWidth="lg">
        <ContentWrapper
          sx={{
            transform: isPlaying ? "translateY(0)" : "translateY(-10px)",
          }}
        >
          <Typography
            variant={isSmallScreen ? "h4" : "h2"}
            component="h1"
            gutterBottom
            fontWeight="bold"
          >
            {slides[currentSlide].title}
          </Typography>
          <Typography variant={isSmallScreen ? "h6" : "h5"} paragraph>
            {slides[currentSlide].subtitle}
          </Typography>
          <Button
            variant="contained"
            size="large"
            endIcon={<ArrowForwardIcon />}
            sx={{
              mt: 2,
              mb: isSmallScreen ? 4 : 6,
              backgroundColor: "#0071dc",
              "&:hover": { backgroundColor: "#071dc" },
            }}
          >
            Shop Now
          </Button>

          <Grid container spacing={isSmallScreen ? 2 : 4}>
            {categories.map((category, index) => (
              <Grid item xs={12} sm={4} key={index}>
                <CategoryBox>
                  <Box
                    component="img"
                    src={category.image}
                    alt={category.name}
                    loading="lazy"
                    sx={{
                      width: "100%",
                      height: 100, // Fixed height for uniformity
                      objectFit: "cover", // Ensures the image covers the area, cropping if necessary
                      mb: 2,
                      borderRadius: theme.shape.borderRadius, // Consistent rounded corners
                      transition: "transform 0.3s ease-in-out",
                      "&:hover": {
                        transform: "scale(1.05)",
                      },
                    }}
                  />
                  <CategoryIcon className="CategoryIcon">
                    <ArrowForwardIcon fontSize="small" />
                  </CategoryIcon>
                  <Link href="#" color="inherit" underline="hover">
                    <Typography variant="subtitle1" color="text.primary">
                      {category.name}{" "}
                      <ArrowForwardIcon
                        fontSize="small"
                        sx={{ verticalAlign: "middle" }}
                      />
                    </Typography>
                  </Link>
                </CategoryBox>
              </Grid>
            ))}
          </Grid>
        </ContentWrapper>
      </Container>

      {/* Pagination Dots */}
      <PaginationDots>
        {slides.map((_, index) => (
          <Dot
            key={index}
            active={index === currentSlide}
            onClick={() => setCurrentSlide(index)}
            aria-label={`Go to slide ${index + 1}`}
            role="button"
            tabIndex={0}
            onKeyPress={(e) => {
              if (e.key === "Enter" || e.key === " ") {
                setCurrentSlide(index);
              }
            }}
          />
        ))}
      </PaginationDots>

      {/* Control Buttons */}
      <Box
        sx={{
          position: "absolute",
          bottom: isSmallScreen ? 60 : 16,
          right: 16,
          display: "flex",
          gap: 1,
        }}
      >
        <ControlButton onClick={handlePrevSlide} aria-label="Previous Slide">
          <ChevronLeftIcon fontSize="small" />
        </ControlButton>
        <ControlButton onClick={handleNextSlide} aria-label="Next Slide">
          <ChevronRightIcon fontSize="small" />
        </ControlButton>
        <ControlButton onClick={togglePlayPause} aria-label="Play/Pause Slide">
          {isPlaying ? (
            <PauseIcon fontSize="small" />
          ) : (
            <PlayArrowIcon fontSize="small" />
          )}
        </ControlButton>
      </Box>
    </BannerContainer>
  );
};

export default Banner;