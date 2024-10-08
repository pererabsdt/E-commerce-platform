import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import bikeImg from "../../assets/images/bike.jpg";
import carImg from "../../assets/images/car.jpg";
import tvImg from "../../assets/images/tv.jpg";

const NewArrival = () => {
  const [cart, setCart] = useState([]);

  // Function to add item to the cart
  const addToCart = (item) => {
    setCart([...cart, item]);
  };

  // Function to display number of items in cart
  const displayCartCount = () => {
    return cart.length;
  };

  // Product data for each card
  const products = [
    { id: 1, title: "Sporty Bike", price: "$899.99", image: bikeImg },
    { id: 2, title: "Luxury Car", price: "$45,000", image: carImg },
    { id: 3, title: "50 inch Ultra HD TV", price: "$1200", image: tvImg },
  ];

  return (
    <section className="new-arrivals-section mb-4">
      <h4 className="text-center my-4">New Arrivals</h4>

      {/* Display Cart Count */}
      <div className="text-center mb-4">
        <span className="badge bg-success p-2">
          Cart Items: {displayCartCount()}
        </span>
      </div>

      <div className="row justify-content-center">
        {products.map((product) => (
          <div key={product.id} className="col-md-4 d-flex align-items-stretch">
            <div className="card shadow-sm mb-4" style={{ width: "18rem" }}>
              <img
                src={product.image}
                className="card-img-top"
                alt={product.title}
                style={{ height: "200px", objectFit: "cover" }}
              />
              <div className="card-body">
                <h5 className="card-title">{product.title}</h5>
                <p className="card-text">{product.price}</p>
                <div className="d-flex justify-content-between">
                  <button
                    className="btn btn-primary"
                    onClick={() => addToCart(product)}
                  >
                    Add to Cart
                  </button>
                  <button className="btn btn-secondary">View Details</button>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
};

export default NewArrival;
