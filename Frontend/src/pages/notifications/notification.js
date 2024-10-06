import React from "react";
import Header from "../../components/header";
import {
  Container,
  Typography,
  List,
  ListItem,
  ListItemText,
  ListItemAvatar,
  Avatar,
  Divider,
  Paper,
} from "@mui/material";
import {
  ShoppingCart,
  LocalShipping,
  Loyalty,
  MonetizationOn,
} from "@mui/icons-material";

const notifications = [
  {
    id: 1,
    type: "order",
    message: "Your order #1234 has been confirmed!",
    icon: ShoppingCart,
    time: "2 hours ago",
  },
  {
    id: 2,
    type: "shipping",
    message: "Your package has been shipped. Track it here.",
    icon: LocalShipping,
    time: "1 day ago",
  },
  {
    id: 3,
    type: "promotion",
    message: "New sale! 20% off on all electronics.",
    icon: Loyalty,
    time: "3 days ago",
  },
  {
    id: 4,
    type: "refund",
    message: "Refund processed for order #9876.",
    icon: MonetizationOn,
    time: "1 week ago",
  },
];

const NotificationPage = () => {
  return (
    <>
      <Header />  
      <Container maxWidth="md" sx={{ mt: 4 }}>
        <Paper elevation={3} sx={{ p: 3 }}>
        <Typography variant="h4" gutterBottom>
          Notifications
        </Typography>
        <List>
          {notifications.map((notification, index) => (
            <React.Fragment key={notification.id}>
              <ListItem alignItems="flex-start">
                <ListItemAvatar>
                  <Avatar sx={{ bgcolor: "primary.main" }}>
                    <notification.icon />
                  </Avatar>
                </ListItemAvatar>
                <ListItemText
                  primary={notification.message}
                  secondary={
                    <React.Fragment>
                      <Typography
                        sx={{ display: "inline" }}
                        component="span"
                        variant="body2"
                        color="text.primary"
                      >
                        {notification.time}
                      </Typography>
                    </React.Fragment>
                  }
                />
              </ListItem>
              {index < notifications.length - 1 && (
                <Divider variant="inset" component="li" />
              )}
            </React.Fragment>
          ))}
        </List>
        </Paper>
      </Container>
    </>
  );
};

export default NotificationPage;
