# # This is a seed file for your Rails application.
# # Use it to populate the database with initial data.
# # Run `rails db:seed` to execute this file.

# puts "Seeding Currencies..."
currency = Currency.where(name: "Euro", symbol: "€").first_or_create!
# puts "Currencies seeded successfully."

# puts "Seeding Unit of Measures..."
# piece_unit = UnitOfMeasure.where(name: "Piece", unit: "pc").first_or_create!
# box_unit = UnitOfMeasure.where(name: "Box", unit: "box").first_or_create!
# kilogram_unit = UnitOfMeasure.where(name: "Kilogram", unit: "kg").first_or_create!
# puts "Unit of Measures seeded successfully."

# puts "Seeding Users..."
user = User.where(email: "user@example.com").first_or_create! do |u|
  u.password = "password"
  u.password_confirmation = "password"
  u.role = "user"
end
# admin = User.where(email: "admin@example.com").first_or_create! do |u|
#   u.password = "password"
#   u.password_confirmation = "password"
#   u.role = "admin"
# end
# puts "Users seeded successfully."

# puts "Seeding Customers..."
john_doe = Customer.where(name: "John Doe", user_id: user.id).first_or_create!
jane_smith = Customer.where(name: "Jane Smith", user_id: user.id).first_or_create!
# puts "Customers seeded successfully."

# puts "Seeding Suppliers..."
# supplier_a = Supplier.where(name: "Supplier A").first_or_create!
# supplier_b = Supplier.where(name: "Supplier B").first_or_create!
# puts "Suppliers seeded successfully."

# puts "Seeding Pricings..."
pricing = Pricing.where(
  price_in_euro: 100,
  old_purchase_price: 90,
  valid_from_old_purchase: Date.new(2023, 1, 1),
  new_purchase_price: 95,
  valid_from_new_purchase: Date.new(2023, 7, 1),
  valid_to_new_purchase: Date.new(2023, 12, 31),
  old_retail_price: 120,
  new_retail_price: 130,
  new_retail_price_valid_from: Date.new(2023, 7, 1),
  new_retail_price_valid_to: Date.new(2024, 6, 30),
  change_in_percentage: 5,
  currency_id: currency.id
).first_or_create!
# puts "Pricings seeded successfully."

# puts "Seeding Main Item Pricings..."
# main_item_pricing = MainItemPricing.where(pricing_id: 9).first_or_create!
# puts "Main Item Pricings seeded successfully."

# puts "Seeding Customer Item Pricings..."
customer_item_pricing_1 = CustomerItemPricing.where(customer_id: john_doe.id, pricing_id: pricing.id).first_or_create!
customer_item_pricing_2 = CustomerItemPricing.where(customer_id: jane_smith.id, pricing_id: pricing.id).first_or_create!
# puts "Customer Item Pricings seeded successfully."

# puts "Seeding Dimensions..."
# dimension_1 = Dimension.where(length: 10, width: 5, height: 3).first_or_create!
# dimension_2 = Dimension.where(length: 15, width: 8, height: 4).first_or_create!
# puts "Dimensions seeded successfully."

# puts "Seeding Items..."
# item_1 = Item.where(
#   item_code: "ABC001",
#   decor_code: "DEC001",
#   item_name: "Item 1",
#   item_description: "Description for Item 1",
#   image: "item1.jpg",
#   dimension_id: dimension_1.id,
#   article_group: "Group A",
#   tax_class: "Class 1",
#   weight: "0.5kg",
#   base_unit_id: piece_unit.id,
#   target_unit_id: box_unit.id,
#   main_item_pricing_id: main_item_pricing.id,
#   customer_item_pricing_id: customer_item_pricing_1.id
# ).first_or_create!

# item_2 = Item.where(
#   item_code: "DEF001",
#   decor_code: "DEC002",
#   item_name: "Item 2",
#   item_description: "Description for Item 2",
#   image: "item2.jpg",
#   dimension_id: dimension_2.id,
#   article_group: "Group B",
#   tax_class: "Class 2",
#   weight: "1kg",
#   base_unit_id: box_unit.id,
#   target_unit_id: kilogram_unit.id,
#   main_item_pricing_id: main_item_pricing.id,
#   customer_item_pricing_id: customer_item_pricing_2.id
# ).first_or_create!
# puts "Items seeded successfully."

# puts "Seeding Supplier Item Pricings..."
# supplier_item_pricing_1 = SupplierItemPricing.where(
#   status: "Active",
#   supplier_id: supplier_a.id,
#   pricing_id: pricing.id,
#   item_id: item_1.id,
#   reference_number: "REF001"
# ).first_or_create!

# supplier_item_pricing_2 = SupplierItemPricing.where(
#   status: "Active",
#   supplier_id: supplier_b.id,
#   pricing_id: pricing.id,
#   item_id: item_2.id,
#   reference_number: "REF002"
# ).first_or_create!
# puts "Supplier Item Pricings seeded successfully."

# puts "Seeding Notifications..."
# notification = Notification.where(
#   title: "New Notification",
#   body: "This is a notification.",
#   sender: "Admin",
#   status: Notification::UNREAD,
#   delivery_date: Date.today,
#   user_id: user.id
# ).first_or_create!
# puts "Notifications seeded successfully."

# puts "Seed data has been successfully created."
