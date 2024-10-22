import React, { useState } from "react";
import { styled } from "@mui/material/styles";
import {
  Container,
  Card,
  CardMedia,
  CardContent,
  CardActions,
  Typography,
  Button,
  Grid,
  Modal,
  Badge,
  Box,
} from "@mui/material";
import bikeImg from "../../assets/images/bike.jpg";
import carImg from "../../assets/images/car.jpg";
import tvImg from "../../assets/images/tv.jpg";

// Styled components
const StyledCard = styled(Card)(({ theme }) => ({
  height: "100%",
  display: "flex",
  flexDirection: "column",
  transition: "transform 0.3s, box-shadow 0.3s",
  borderRadius: theme.shape.borderRadius * 2, // Increased border radius
  "&:hover": {
    transform: "translateY(-5px)",
    boxShadow: theme.shadows[10],
  },
}));

const StyledCardMedia = styled(CardMedia)({
  paddingTop: "56.25%", // 16:9 aspect ratio
});

const StyledCardContent = styled(CardContent)({
  flexGrow: 1,
  padding: "16px",
});

const GoodDeals = () => {
  const [cart, setCart] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [showModal, setShowModal] = useState(false);

  // Product data for each card
  const products = [
    {
      id: 1,
      title: "Sporty Bike",
      price: 899.99,
      image: bikeImg,
      description:
        "A sleek and powerful sports bike designed for adrenaline lovers.",
    },
    {
      id: 2,
      title: "Luxury Car",
      price: 45000,
      image: carImg,
      description:
        "Drive in style with this luxury car, built with high-end features.",
    },
    {
      id: 3,
      title: "50 inch Ultra HD TV",
      price: 1200,
      image: tvImg,
      description:
        "Experience movies in 4K with this ultra high definition TV.",
    },
  ];

  const handleAddToCart = (product) => {
    setCart([...cart, product]);
  };

  const handleViewDetails = (product) => {
    setSelectedProduct(product);
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setSelectedProduct(null);
  };

  const displayCartCount = () => cart.length;

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      {/* Display Cart Count */}
      <Box sx={{ display: "flex", justifyContent: "center", mb: 4 }}>
        <Badge badgeContent={displayCartCount()} color="success" sx={{ p: 2 }}>
          <Typography variant="h6">Cart Items</Typography>
        </Badge>
      </Box>

      <Grid container spacing={4}>
        {products.map((product) => (
          <Grid item key={product.id} xs={12} sm={6} md={4}>
            <StyledCard>
              <StyledCardMedia image={product.image} title={product.title} />
              <StyledCardContent>
                <Typography gutterBottom variant="h6" component="div" noWrap>
                  {product.title}
                </Typography>
                <Typography variant="h6" color="primary" gutterBottom>
                  ${product.price.toLocaleString()}
                </Typography>
                <Typography variant="body2" color="text.secondary" noWrap>
                  {product.description}
                </Typography>
              </StyledCardContent>
              <CardActions sx={{ justifyContent: "center", px: 2, pb: 2 }}>
                <Button
                  size="small"
                  variant="contained"
                  onClick={() => handleAddToCart(product)}
                >
                  Add to Cart
                </Button>
                <Button
                  size="small"
                  variant="outlined"
                  onClick={() => handleViewDetails(product)}
                >
                  View Details
                </Button>
              </CardActions>
            </StyledCard>
          </Grid>
        ))}
      </Grid>

      {/* Modal for Product Details */}
      <Modal open={showModal} onClose={handleCloseModal}>
        <Box
          sx={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            width: 400,
            bgcolor: "background.paper",
            boxShadow: 24,
            p: 4,
            borderRadius: 4,
          }}
        >
          {selectedProduct && (
            <>
              <Typography variant="h6" component="h2">
                {selectedProduct.title}
              </Typography>
              <img
                src={selectedProduct.image}
                alt={selectedProduct.title}
                style={{
                  width: "100%",
                  marginBottom: "1rem",
                  borderRadius: "8px",
                }}
              />
              <Typography variant="h6" color="primary" sx={{ mt: 2 }}>
                ${selectedProduct.price.toLocaleString()}
              </Typography>
              <Typography variant="body2" color="text.secondary">
                {selectedProduct.description}
              </Typography>
              <Box sx={{ mt: 2, display: "flex", justifyContent: "center" }}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleCloseModal}
                >
                  Close
                </Button>
              </Box>
            </>
          )}
        </Box>
      </Modal>
    </Container>
  );
};

export default GoodDeals;
