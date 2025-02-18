FactoryBot.define do
    factory :car_battery do
      brand { "Toyota" }
      model { "X200" }
      voltage { 12 }
      price { 250 }
      warranty { 24 }
    end
  end
  