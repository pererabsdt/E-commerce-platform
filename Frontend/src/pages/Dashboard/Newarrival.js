import React, { useState } from "react";
import {
  Box,
  Typography,
  Card,
  CardMedia,
  CardContent,
  CardActions,
  Button,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Grid,
  Modal,
  Rating,
  Container,
  IconButton,
  Badge,
} from "@mui/material";
import { styled, alpha } from "@mui/material/styles";
import ShareIcon from "@mui/icons-material/Share";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import carImage from "../../assets/images/car.jpg";

// Styled components
const StyledCard = styled(Card)(({ theme }) => ({
  height: "100%",
  display: "flex",
  flexDirection: "column",
  transition: "transform 0.3s, box-shadow 0.3s",
  borderRadius: theme.shape.borderRadius * 2,
  overflow: "hidden",
  "&:hover": {
    transform: "translateY(-8px)",
    boxShadow: theme.shadows[15],
  },
}));

const StyledCardMedia = styled(CardMedia)({
  paddingTop: "56.25%", // 16:9 aspect ratio
  transition: "transform 0.3s",
  "&:hover": {
    transform: "scale(1.1)",
  },
});

const StyledCardContent = styled(CardContent)({
  flexGrow: 1,
  padding: "16px",
});

const StyledSelect = styled(Select)(({ theme }) => ({
  backgroundColor: alpha(theme.palette.background.paper, 0.8),
  "&:hover": {
    backgroundColor: alpha(theme.palette.background.paper, 0.9),
  },
}));

const DiscountBadge = styled(Badge)(({ theme }) => ({
  position: "absolute",
  top: theme.spacing(2),
  left: theme.spacing(2),
}));

const ContentBox = styled(Box)(({ theme }) => ({
  backgroundColor: alpha(theme.palette.background.paper, 0.8),
  borderRadius: theme.shape.borderRadius * 2,
  padding: theme.spacing(3),
}));

const NewArrival = () => {
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [sortOption, setSortOption] = useState("");

  const handleSort = (event) => {
    setSortOption(event.target.value);
  };

  const handleViewDetails = (product) => {
    setSelectedProduct(product);
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setSelectedProduct(null);
  };

  const products = [
    {
      id: 1,
      title: "Luxury Sedan",
      price: 45000,
      image: carImage,
      category: "Vehicles",
      description: "A sleek and powerful luxury sedan with advanced features.",
      rating: 4.8,
      soldCount: 50,
      discount: 10, // 10% discount
    },
    {
      id: 2,
      title: "Sports Coupe",
      price: 55000,
      image: carImage,
      category: "Vehicles",
      description: "High-performance sports coupe for the driving enthusiast.",
      rating: 4.9,
      soldCount: 30,
      discount: 5, // 5% discount
    },
    {
      id: 3,
      title: "Electric SUV",
      price: 60000,
      image: carImage,
      category: "Vehicles",
      description:
        "Eco-friendly electric SUV with long range and spacious interior.",
      rating: 4.7,
      soldCount: 40,
    },
    {
      id: 4,
      title: "Family Minivan",
      price: 35000,
      image: carImage,
      category: "Vehicles",
      description:
        "Comfortable and practical minivan perfect for family trips.",
      rating: 4.6,
      soldCount: 60,
    },
    {
      id: 5,
      title: "Off-road 4x4",
      price: 50000,
      image: carImage,
      category: "Vehicles",
      description:
        "Rugged 4x4 vehicle built for challenging off-road adventures.",
      rating: 4.8,
      soldCount: 35,
      discount: 15, // 15% discount
    },
    {
      id: 6,
      title: "Compact Hatchback",
      price: 25000,
      image: carImage,
      category: "Vehicles",
      description: "Fuel-efficient compact hatchback ideal for city driving.",
      rating: 4.5,
      soldCount: 80,
    },
  ];

  const sortedProducts = [...products].sort((a, b) => {
    if (sortOption === "priceLowHigh") return a.price - b.price;
    if (sortOption === "priceHighLow") return b.price - a.price;
    if (sortOption === "bestSelling") return b.soldCount - a.soldCount;
    return 0;
  });

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <ContentBox>
        <Box
          sx={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            mb: 3,
          }}
        >
          <Typography
            variant="h4"
            component="h1"
            sx={{ fontWeight: "bold", color: "primary.main" }}
          >
            New Arrival
          </Typography>
          <FormControl sx={{ minWidth: 120 }}>
            <InputLabel id="sort-select-label">Sort By</InputLabel>
            <StyledSelect
              labelId="sort-select-label"
              value={sortOption}
              label="Sort By"
              onChange={handleSort}
            >
              <MenuItem value="">
                <em>None</em>
              </MenuItem>
              <MenuItem value="bestSelling">Best Selling</MenuItem>
              <MenuItem value="priceLowHigh">Price: Low to High</MenuItem>
              <MenuItem value="priceHighLow">Price: High to Low</MenuItem>
            </StyledSelect>
          </FormControl>
        </Box>

        <Grid container spacing={3}>
          {sortedProducts.map((product) => (
            <Grid item key={product.id} xs={12} sm={6} md={4}>
              <Box position="relative">
                {product.discount && (
                  <DiscountBadge
                    badgeContent={`-${product.discount}%`}
                    color="secondary"
                  />
                )}
                <StyledCard>
                  <StyledCardMedia
                    image={product.image}
                    title={product.title}
                  />
                  <StyledCardContent>
                    <Typography
                      gutterBottom
                      variant="h6"
                      component="div"
                      noWrap
                    >
                      {product.title}
                    </Typography>
                    <Typography variant="h6" color="primary" gutterBottom>
                      ${product.price.toLocaleString()}
                    </Typography>
                    <Box
                      sx={{
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                        mb: 1,
                      }}
                    >
                      <Typography variant="body2" color="text.secondary">
                        {product.category}
                      </Typography>
                      <Rating
                        name="read-only"
                        value={product.rating}
                        precision={0.1}
                        readOnly
                        size="small"
                      />
                    </Box>
                    <Typography variant="body2" color="text.secondary">
                      {product.soldCount} sold
                    </Typography>
                  </StyledCardContent>
                  <CardActions
                    sx={{ justifyContent: "space-between", px: 2, pb: 2 }}
                  >
                    <Button
                      size="small"
                      variant="contained"
                      onClick={() => handleViewDetails(product)}
                    >
                      View Details
                    </Button>
                    <Button
                      size="small"
                      variant="outlined"
                      onClick={() => alert(`Buying ${product.title}`)}
                    >
                      Buy Now
                    </Button>
                  </CardActions>
                  <CardActions sx={{ justifyContent: "center", px: 2, pb: 2 }}>
                    <IconButton>
                      <FavoriteBorderIcon />
                    </IconButton>
                    <IconButton>
                      <ShareIcon />
                    </IconButton>
                  </CardActions>
                </StyledCard>
              </Box>
            </Grid>
          ))}
        </Grid>
      </ContentBox>

      {/* Modal for product details */}
      <Modal
        open={showModal}
        onClose={handleCloseModal}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box
          sx={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            bgcolor: "background.paper",
            borderRadius: 2,
            boxShadow: 24,
            p: 4,
            maxWidth: 400,
            width: "100%",
          }}
        >
          {selectedProduct && (
            <>
              <Typography
                id="modal-modal-title"
                variant="h6"
                component="h2"
                gutterBottom
              >
                {selectedProduct.title}
              </Typography>
              <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                {selectedProduct.description}
              </Typography>
              <Typography variant="body1" sx={{ mt: 2 }}>
                Price: ${selectedProduct.price.toLocaleString()}
              </Typography>
              <Rating
                value={selectedProduct.rating}
                readOnly
                precision={0.1}
                size="small"
              />
              <Box sx={{ mt: 2 }}>
                <Button
                  fullWidth
                  variant="contained"
                  onClick={() => alert(`Buying ${selectedProduct.title}`)}
                >
                  Buy Now
                </Button>
              </Box>
            </>
          )}
        </Box>
      </Modal>
    </Container>
  );
};

export default NewArrival;
