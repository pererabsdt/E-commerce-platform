# E-commerce-platform


- The user will be asked whether they are registered or guest customer user during the checkout.

# How products and variants are handled??
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
      
