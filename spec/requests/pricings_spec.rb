require 'rails_helper'

RSpec.describe "Pricings", type: :request do
  include_examples('request_shared_spec', 'pricings', 14)
  
  let(:valid_attributes) do
    {
      price_in_euro: 100,
      old_purchase_price: 100,
      valid_from_old_purchase:  Faker::Date.forward(days: 22) ,
      new_purchase_price:  200 ,
      valid_from_new_purchase:  Faker::Date.forward(days: 25) ,
      valid_to_new_purchase:  Faker::Date.forward(days: 13) ,
      old_retail_price:  250 ,
      new_retail_price: 350,
      new_retail_price_valid_from:  Faker::Date.forward(days: 13) ,
      new_retail_price_valid_to:  Faker::Date.forward(days: 6) ,
      change_in_percentage: 10,
      currency_id: create(:currency).id 
    }
  end

  let(:invalid_attributes) do
    {
      price_in_euro: nil,
      old_purchase_price: 100,
      valid_from_old_purchase:  Faker::Date.forward(days: 22) ,
      new_purchase_price:  200 ,
      valid_from_new_purchase:  Faker::Date.forward(days: 25) ,
      valid_to_new_purchase:  Faker::Date.forward(days: 13) ,
      old_retail_price:  250 ,
      new_retail_price: 350,
      new_retail_price_valid_from:  Faker::Date.forward(days: 13) ,
      new_retail_price_valid_to:  Faker::Date.forward(days: 6) ,
      change_in_percentage: 10,
      currency_id: create(:currency).id 
    }
  end

  let(:new_attributes) do
    {
      price_in_euro: 200,
    }
  end
end
