# E-commerce-platform

## How user logins and guest users are handled?
- The user can choose to log in or continue as guest during a session.
- Every user will get a unique guest id when they access the site.
- The user can add/remove item to the temporary cart with this guest id.
  
- The user will be asked whether they are registered or guest customer user during the checkout.
- If they select registered user and provide the required details, some required fields for checkout will get automatically filled.
- A guest user will have to enter the required details to confirm the order.

# How products and variants are handled??
- prodcut table
      - Contains different products(ex:- iphone X, JBL speaker). Relate with category table
- categories
      - sub categories could be handled by either self joins or a new sub_category_table. Need to choose the best option!!
- variations
      - contains the different variations of different categories of products
          (ex:- Phones - color, storage capacity)
- variant_option
      - contains the different options under the variations(ex:- color -> red, blue, etc...)
- variant
      - contains the atomic prodcut item details (ex:- iphone 16 blue, 256GB ROM, 32GB RAM)
  
