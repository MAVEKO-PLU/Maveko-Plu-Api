FactoryBot.define do
  factory :sales_order_document do
    so_num { Faker::Code.npi }
    status { SalesOrderDocument::APPROVED }
  end
end
