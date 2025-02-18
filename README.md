# Interview Assignment - Rails

## Setup Instructions

# To set up and run the project, follow these steps:

## Clone the repository:

git clone https://github.com/Amirasyraf222/Interview-Assignment-Rails---Amir-Asyraf.git

## Navigate to the project directory:

cd project

## Install dependencies:

bundle install

## Run database migrations:

rails db:migrate

## Start the Rails server:

rails server

# API Endpoints

# Below is a list of API endpoints successfully tested in Postman.

# 1. User Authentication

## Sign Up

Endpoint:

POST http://localhost:3000/auth

Example Request Body (JSON):

{
  "email": "testuser@example.com",
  "password": "password123",
  "password_confirmation": "password123",
  "name": "Test User"
}

## Sign In

Endpoint:

POST http://localhost:3000/auth/sign_in

Example Request Body (JSON):

{
  "email": "user@example.com",
  "password": "password123"
}

Note: For any authenticated API requests, include the following headers:

{
  "access-token": "your_generated_token",
  "client": "your_client_id",
  "uid": "testuser@example.com",
  "Content-Type": "application/json"
}

# 2. Car Battery Management

## Create Car Battery

Endpoint:

POST http://localhost:3000/car_batteries/create

Example Request Body (JSON):

{
  "car_battery": {
    "brand": "Toyota",
    "model": "X200",
    "voltage": 12,
    "price": 250,
    "warranty": 24
  }
}

## Update Car Battery

Endpoint:

PUT http://localhost:3000/car_batteries/:id/update

Example Request Body (JSON):

{
  "car_battery": {
    "brand": "UpdatedBrand",
    "model": "X300",
    "voltage": 14,
    "price": 300,
    "warranty": 36
  }
}

## View Car Battery

Endpoint:

GET http://localhost:3000/car_batteries/:id/view

## Delete Car Battery

Endpoint:

DELETE http://localhost:3000/car_batteries/:id/delete



# Notes

Ensure that the Rails server is running before making API requests.

Always include the required authentication headers when accessing protected routes.

Replace :id in the URL with the actual car battery ID when performing update, view, or delete operations.

This document provides a structured and professional overview of the setup and API functionalities for your Rails project.

