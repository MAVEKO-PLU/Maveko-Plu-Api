FactoryBot.define do
  factory :customer_formula do
    formula { 3 }
    active { true }
    label { 'test' }
    customer_id { create(:customer).id }
  end
end
