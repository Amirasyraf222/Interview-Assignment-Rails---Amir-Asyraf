require 'rails_helper'

RSpec.describe "CarBatteries API", type: :request do
  let!(:user) { create(:user) }
  let!(:car_batteries) { create_list(:car_battery, 5) }
  let(:car_battery_id) { car_batteries.first.id }

  before do
    post "/auth/sign_in", params: { email: user.email, password: "password123" }
    @auth_headers = response.headers.slice('client', 'access-token', 'expiry', 'uid', 'token-type')
  end

  # LIST ALL CAR BATTERIES
  describe "GET /car_batteries" do
    it "returns all car batteries" do
      get "/car_batteries", headers: @auth_headers
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  # SHOW A SINGLE CAR BATTERY
  describe "GET /car_batteries/:id/view" do
    it "returns a single car battery" do
      get "/car_batteries/#{car_battery_id}/view", headers: @auth_headers
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq(car_battery_id)
    end
  end

  # CREATE A CAR BATTERY
  describe "POST /car_batteries/create" do
    let(:valid_params) { { car_battery: { brand: "Toyota", model: "X200", voltage: 12, price: 250, warranty: 24 } } }

    it "creates a new car battery" do
      expect {
        post "/car_batteries/create", params: valid_params, headers: @auth_headers
      }.to change(CarBattery, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end

  # UPDATE A CAR BATTERY
  describe "PUT /car_batteries/:id/update" do
    let(:update_params) { { car_battery: { brand: "UpdatedBrand" } } }

    it "updates the car battery" do
      put "/car_batteries/#{car_battery_id}/update", params: update_params, headers: @auth_headers
      expect(response).to have_http_status(200)
      expect(CarBattery.find(car_battery_id).brand).to eq("UpdatedBrand")
    end
  end

  # DELETE A CAR BATTERY
  describe "DELETE /car_batteries/:id/delete" do
    it "deletes the car battery" do
      expect {
        delete "/car_batteries/#{car_battery_id}/delete", headers: @auth_headers
      }.to change(CarBattery, :count).by(-1)

      expect(response).to have_http_status(204)
    end
  end
end
