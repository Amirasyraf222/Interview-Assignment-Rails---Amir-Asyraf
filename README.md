# Interview-Assignment-Rails---Amir-Asyraf

# README

## Setup Instructions


1. git clone <repository-url>
2. cd <repository-folder>
3. bundle install
4. rails db:migrate
5. rails server

These are the list of API succesfully tested in Postman : 

1. Sign Up - POST http://localhost:3000/auth
   
   Example data (JSON) : 
   {
  "email": "testuser@example.com",
  "password": "password123",
  "password_confirmation": "password123",
  "name": "Test User"
    }

2. Sign In - POST http://localhost:3000/auth/sign_in

    Example data (JSON) : 
   {
  "email": "user@example.com",
  "password": "password123",
  "password_confirmation": "password123"
    }

Note : For any authenticated API requests, make sure to include these headers:
{
  "access-token": "your_generated_token",
  "client": "your_client_id",
  "uid": "testuser@example.com",
  "Content-Type": "application/json"
}

3. Cars create - POST http://localhost:3000/car_batteries/create

    Example data (JSON) : 

   {
  "car_battery": {
    "brand": "Toyota",
    "model": "X200",
    "voltage": 12,
    "price": 250,
    "warranty": 24
    }
    }


4. Cars update - PUT http://localhost:3000/car_batteries/:id/update

    Example data (JSON) : 

   {
  "car_battery": {
    "brand": "UpdatedBrand",
    "model": "X300",
    "voltage": 14,
    "price": 300,
    "warranty": 36
    }
    }

5. Cars view - GET http://localhost:3000//car_batteries/:id/view


6. Cars delete - DELETE http://localhost:3000//car_batteries/:id/delete


