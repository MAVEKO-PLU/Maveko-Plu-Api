class CreateSalesOrderDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_order_documents do |t|
      t.string :so_num, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
