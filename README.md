# Product Tracker API

#### This API allows you to view, create, update, or delete products stored in the database.

#### By George Acosta

## Specifications

1. This API will let users add, update and delete new product database.


## Setup/Installation Requirements

* Open terminal and run git clone https://github.com/GACOSTA1988/product-tracker-API.git
* While in the root of the terminal run bundle install
* Once Gemfile is bundled run the following in the terminal:
1. rake db:create
2. rake db:migrate
3. rake db:test:prepare
* After db set up is successfully complete, begin the local server by running rails s in the terminal

## API Endpoints
#### GET
- localhost:3000/products
#### POST
- localhost:3000/products
    > Params: name
#### PATCH
- localhost:3000/products/id
    > Params: name
#### DELETE
- localhost:3000/products/id




## Technologies Used

1. ruby
2. rspec
3. Devise



### License

Copyright (c) 2016 **_George Acosta_**
