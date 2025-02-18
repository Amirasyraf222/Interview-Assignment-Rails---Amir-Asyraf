require 'rails_helper'

RSpec.describe CarBattery, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      battery = CarBattery.new(
        brand: 'Toyota',
        model: 'X200',
        voltage: 12,
        price: 250,
        warranty: 24
      )
      expect(battery).to be_valid
    end

    it 'is not valid without a brand' do
      battery = CarBattery.new(model: 'X200', voltage: 12, price: 250, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid without a model' do
      battery = CarBattery.new(brand: 'Toyota', voltage: 12, price: 250, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid without a voltage' do
      battery = CarBattery.new(brand: 'Toyota', model: 'X200', price: 250, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid with a negative voltage' do
      battery = CarBattery.new(brand: 'Toyota', model: 'X200', voltage: -12, price: 250, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid without a price' do
      battery = CarBattery.new(brand: 'Toyota', model: 'X200', voltage: 12, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid with a negative price' do
      battery = CarBattery.new(brand: 'Toyota', model: 'X200', voltage: 12, price: -50, warranty: 24)
      expect(battery).to_not be_valid
    end

    it 'is not valid without a warranty' do
      battery = CarBattery.new(brand: 'Toyota', model: 'X200', voltage: 12, price: 250)
      expect(battery).to_not be_valid
    end
  end
end
