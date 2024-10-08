import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Header from "../../components/header";
import AllCategory from "../../components/allCatagery";
import ProductList from "./ProductList";
import FilterSidebar from "./FilterSidebar";
import Banner from "./Banner";
import Footer from "../../components/footer"; // Update if necessary

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
            <Banner />

            {/* Our Products */}
            <section className="products-section mb-4">
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
        
      </div>
      <Footer />
    </>
  );
};

export default HomePage;
