class RenaminCols < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_formulas, :label, :string, null: false
    add_column :customer_formulas, :label, :string, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
