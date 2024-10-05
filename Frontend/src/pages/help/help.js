import React, { useState } from "react";
import Header from "../../components/header";
import {
  Container,
  Typography,
  Accordion,
  AccordionSummary,
  AccordionDetails,
  TextField,
  Button,
  Box,
  Link,
  Paper,
  Divider,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
} from "@mui/material";
import {
  ExpandMore,
  ContactSupport,
  Email,
  Phone,
  LiveHelp,
  Search,
  ChatBubble,
} from "@mui/icons-material";

const faqData = [
  {
    question: "How do I track my order?",
    answer:
      "You can track your order by logging into your account and visiting the 'Order History' section. There you'll find a tracking number for your shipment.",
  },
  {
    question: "What is your return policy?",
    answer:
      "We offer a 30-day return policy for most items. Please ensure the item is unused and in its original packaging. You can initiate a return from your account dashboard.",
  },
  {
    question: "How can I change my password?",
    answer:
      "To change your password, go to your account settings and select 'Change Password'. You'll need to enter your current password and then your new password twice to confirm.",
  },
  // Add more FAQ items as needed
];

const HelpSupportPage = () => {
  const [ticketSubject, setTicketSubject] = useState("");
  const [ticketDescription, setTicketDescription] = useState("");

  const handleTicketSubmit = (e) => {
    e.preventDefault();
    // Here you would typically send the ticket data to your backend
    console.log("Ticket submitted:", { ticketSubject, ticketDescription });
    // Reset form fields
    setTicketSubject("");
    setTicketDescription("");
    // Show a success message to the user (you could use a snackbar or alert here)
  };

  return (
    <>
      <Header />    
      <Container maxWidth="md" sx={{ mt: 4, mb: 4 }}>
        <Typography variant="h3" gutterBottom>
        Help & Support
      </Typography>

      {/* Search Bar */}
      <Paper elevation={3} sx={{ p: 2, mb: 4 }}>
        <Box display="flex" alignItems="center">
          <Search sx={{ mr: 1 }} />
          <TextField
            fullWidth
            variant="outlined"
            size="small"
            placeholder="Search for help topics..."
          />
        </Box>
      </Paper>

      {/* Quick Links */}
      <Paper elevation={3} sx={{ p: 2, mb: 4 }}>
        <Typography variant="h6" gutterBottom>
          Quick Help
        </Typography>
        <List>
          <ListItem button component={Link} href="/faq">
            <ListItemIcon>
              <LiveHelp />
            </ListItemIcon>
            <ListItemText primary="Frequently Asked Questions" />
          </ListItem>
          <ListItem button component={Link} href="/contact">
            <ListItemIcon>
              <ContactSupport />
            </ListItemIcon>
            <ListItemText primary="Contact Us" />
          </ListItem>
          <ListItem button component={Link} href="/live-chat">
            <ListItemIcon>
              <ChatBubble />
            </ListItemIcon>
            <ListItemText primary="Live Chat Support" />
          </ListItem>
        </List>
      </Paper>

      {/* FAQ Section */}
      <Typography variant="h5" gutterBottom>
        Frequently Asked Questions
      </Typography>
      {faqData.map((faq, index) => (
        <Accordion key={index}>
          <AccordionSummary expandIcon={<ExpandMore />}>
            <Typography>{faq.question}</Typography>
          </AccordionSummary>
          <AccordionDetails>
            <Typography>{faq.answer}</Typography>
          </AccordionDetails>
        </Accordion>
      ))}

      <Divider sx={{ my: 4 }} />

      {/* Help Desk Ticket Booking */}
      <Typography variant="h5" gutterBottom>
        Submit a Support Ticket
      </Typography>
      <Paper elevation={3} sx={{ p: 3, mb: 4 }}>
        <form onSubmit={handleTicketSubmit}>
          <TextField
            fullWidth
            label="Subject"
            variant="outlined"
            margin="normal"
            value={ticketSubject}
            onChange={(e) => setTicketSubject(e.target.value)}
            required
          />
          <TextField
            fullWidth
            label="Description"
            variant="outlined"
            margin="normal"
            multiline
            rows={4}
            value={ticketDescription}
            onChange={(e) => setTicketDescription(e.target.value)}
            required
          />
          <Button
            type="submit"
            variant="contained"
            color="primary"
            sx={{ mt: 2 }}
          >
            Submit Ticket
          </Button>
        </form>
      </Paper>

      {/* Contact Information */}
      <Typography variant="h5" gutterBottom>
        Contact Us
      </Typography>
      <Paper elevation={3} sx={{ p: 3 }}>
        <List>
          <ListItem>
            <ListItemIcon>
              <Email />
            </ListItemIcon>
            <ListItemText primary="Email" secondary="support@example.com" />
          </ListItem>
          <ListItem>
            <ListItemIcon>
              <Phone />
            </ListItemIcon>
            <ListItemText primary="Phone" secondary="+1 (555) 123-4567" />
          </ListItem>
          <ListItem>
            <ListItemIcon>
              <ContactSupport />
            </ListItemIcon>
            <ListItemText
              primary="Visit our full contact page"
              secondary={
                <Link href="/contact" color="secondary">
                  Contact Page
                </Link>
              }
            />
          </ListItem>
        </List>
      </Paper>
    </Container>
    </>
  );
};

export default HelpSupportPage;
