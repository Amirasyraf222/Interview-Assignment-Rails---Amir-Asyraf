class CarBatteriesController < ApplicationController
    before_action :authenticate_user! # Ensure user authentication before accessing any action
    before_action :set_car_battery, only: [:show, :update, :destroy]
  
    # GET /car_batteries (List all batteries)
    def index
      render json: CarBattery.all
    end
  
    # GET /car_batteries/:id (Show details of a specific battery)
    def show
      render json: @car_battery
    end
  
    # POST /car_batteries (Create a new battery)
    def create
      car_battery = CarBattery.new(car_battery_params)
      if car_battery.save
        render json: car_battery, status: :created
      else
        render json: car_battery.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /car_batteries/:id (Update a battery)
    def update
      if @car_battery.update(car_battery_params)
        render json: @car_battery
      else
        render json: @car_battery.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /car_batteries/:id (Delete a battery)
    def destroy
      @car_battery.destroy
      head :no_content
    end
  
    private
  
    def set_car_battery
      @car_battery = CarBattery.find(params[:id])
    end
  
    def car_battery_params
      params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
    end
  end
  