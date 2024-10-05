import "./assets/styles/App.css";
import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Card from "./pages/cards.jsx";
import CheckoutPage from "./pages/checkout.jsx";
import HomePage from "./pages/Dashboard/home.jsx";
import SignIn from "./pages/sign/sign-in/SignIn.jsx";
import SignUp from "./pages/sign/sign-up/signup.jsx";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="api/cart" element={<Card />} />
        <Route path="/checkout" element={<CheckoutPage />} />
        <Route path="/signin" element={<SignIn />} />
        <Route path="/signup" element={<SignUp />} />
       
      </Routes>
    </Router>
  );
}

export default App;
