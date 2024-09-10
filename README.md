# E-commerce-platform

-
- The user will be asked whether they are registered or guest customer user during the checkout.

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
  
