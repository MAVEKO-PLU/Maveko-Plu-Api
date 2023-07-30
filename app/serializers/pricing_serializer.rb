class PricingSerializer < ActiveModel::Serializer
  attributes :id, :price_in_euro, :old_purchase_price, :valid_from_old_purchase, :new_purchase_price, :valid_from_new_purchase, :valid_to_new_purchase,
              :old_retail_price, :new_retail_price, :new_retail_price_valid_from, :new_retail_price_valid_to, :change_in_percentage, :currency, :updated_at
              has_one :currency
end
