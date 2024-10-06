import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Header from "../../components/header";
import AllCategory from "../../components/allCatagery";
import ProductList from "./ProductList";
import FilterSidebar from "./FilterSidebar";

const HomePage = () => {
  return (
    <>
      <Header />

      <div
        className="container-fluid"
        style={{ maxWidth: "1550px", margin: "0 auto" }}
      >
        <div className="row">
          {/* Sidebar */}
          <div className="col-md-3">
            <FilterSidebar />
          </div>

          {/* Main Content */}
          <main className="col-md-9">
            {/* Hero Section */}
            <section className="hero-section mb-4">
              <div id="carouselExample" className="carousel slide">
                <div className="carousel-inner">
                  <div className="carousel-item active">
                    <img
                      src="https://via.placeholder.com/900x300"
                      className="d-block w-100"
                      alt="Headphone"
                    />
                  </div>
                  <div className="carousel-item">
                    <img
                      src="https://via.placeholder.com/900x300"
                      className="d-block w-100"
                      alt="Macbook Promo"
                    />
                  </div>
                  <div className="carousel-item">
                    <img
                      src="https://via.placeholder.com/900x300"
                      className="d-block w-100"
                      alt="Toys Promo"
                    />
                  </div>
                </div>
                <button
                  className="carousel-control-prev"
                  type="button"
                  data-bs-target="#carouselExample"
                  data-bs-slide="prev"
                >
                  <span
                    className="carousel-control-prev-icon"
                    aria-hidden="true"
                  ></span>
                </button>
                <button
                  className="carousel-control-next"
                  type="button"
                  data-bs-target="#carouselExample"
                  data-bs-slide="next"
                >
                  <span
                    className="carousel-control-next-icon"
                    aria-hidden="true"
                  ></span>
                </button>
              </div>
            </section>

            {/* Our Products */}
            <section className="products-section mb-4">
              <AllCategory />
              <AllCategory />
              <AllCategory />
              <AllCategory />
            </section>

            {/* New Arrivals */}
            <section className="new-arrivals-section mb-4">
              <h4>New Arrivals</h4>
              <div className="row">
                <div className="col-md-4">
                  <div className="card">
                    <img
                      src="https://via.placeholder.com/150"
                      className="card-img-top"
                      alt="Monopoly"
                    />
                    <div className="card-body">
                      <h5 className="card-title">Monopoly Board Game</h5>
                      <p className="card-text">$37.99</p>
                    </div>
                  </div>
                </div>
                <div className="col-md-4">
                  <div className="card">
                    <img
                      src="https://via.placeholder.com/150"
                      className="card-img-top"
                      alt="TV"
                    />
                    <div className="card-body">
                      <h5 className="card-title">50 inch Ultra HD TV</h5>
                      <p className="card-text">$1200</p>
                    </div>
                  </div>
                </div>
                <div className="col-md-4">
                  <div className="card">
                    <img
                      src="https://via.placeholder.com/150"
                      className="card-img-top"
                      alt="Laptop"
                    />
                    <div className="card-body">
                      <h5 className="card-title">Dell Latitude</h5>
                      <p className="card-text">$1500</p>
                    </div>
                  </div>
                </div>
              </div>
            </section>
          </main>
        </div>
      </div>

      <div
        className="container-fluid"
        style={{ maxWidth: "1400px", margin: "0 auto" }}
      >
        <ProductList />
        <ProductList />
        <ProductList />
        <ProductList />
        <ProductList />
      </div>
    </>
  );
};

export default HomePage;
