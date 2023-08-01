class NewChanges < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :customer_item_pricing_id, :bigint,  null: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
