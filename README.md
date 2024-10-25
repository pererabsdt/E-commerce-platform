# E-commerce-platform




## How user logins and guest users are handled?
- The user can choose to log in or continue as guest during a session.
- Every user will get a unique guest id when they access the site.
- The user can add/remove item to the temporary cart with this guest id.
  

- The user will be asked whether they are registered or guest customer user during the checkout.
- If they select registered user and provide the required details, some required fields for checkout will get automatically filled.
- A guest user will have to enter the required details to confirm the order.
- The guest table contains a customer_id attribute which has a default value(ex:- 000000000) if they are unregistered, but if they are registered, it will contain their customer id. 

## How products and variants are handled??
- prodcut table
      - Contains different products(ex:- iphone X, JBL speaker). Relate with category table
- categories
      - Contain product categories(and sub-categories). For example: Electronics -> Phone, Laptop Toys-> Beyblade, Barbie doll. [sub categories could be handled by either self joins or a new sub_category_table]
- variations
      - contains the different variations of different categories of products
          (ex:- Phones - color, storage capacity)
- variant_option
      - contains the different options under the variations(ex:- color -> red, blue, etc...)
- variant
      - contains the atomic prodcut item details (ex:- iphone 16 blue, 256GB ROM, 32GB RAM)


# How order handle
### shop_order
      - Handle the order.
      - Both guest user and registered user order details are included.
      - If user is registered, the custemer is is replased with its actual custemer id.
      - It has foriegn key `guest_id`.
### payment_method
      - Online payment/ Cash on delivary.
### custemer_payment_method
      - want access to registered user details.So include custemer_id as foriegn key.
      - auto fill card number, expire date and name when registered custemer is logging again.
### Order_item
      - Help to include items into order.
      - record quntity and total price of relevent item.
      

## Temporary Cart
- Temporary cart is handled by locally storing(maybe using a view at the front end) the products either the unsigned registered user or a guest user might add.
- If the unsigned in registered user logs in, the product details would be transferred to the cart table in the database. This would be handled by the back end.
- For guest users, at checkout the products in the temporary cart would be transferred to order items and shop order tables.
  
### Delivery module
- In stock and in main city - 5 days
- In stock and not in main city - 7days
- Out of stock and in main city - 8 days
- Out of stock and not in main city - 10 days


## To do
- Finding product and related info --> Under progress Kavinda
- Serchbar  Done
- Dropdown  Done
- propfilepage under progress janodi
