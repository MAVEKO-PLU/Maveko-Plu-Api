class NewChanges3 < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :items, column: :customer_item_pricing_id
    add_foreign_key :items, :customer_item_pricings, column: :customer_item_pricing_id, on_delete: :nullify, null: true
  end
end
