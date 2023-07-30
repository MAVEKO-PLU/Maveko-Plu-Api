require 'rails_helper'

RSpec.describe SalesOrderDocument, type: :model do
  it 'has a valid factory' do
    expect(build(:sales_order_document)).to be_valid
  end

  it {is_expected.to validate_presence_of(:so_num)}
  it {is_expected.to validate_presence_of(:status)}
  it {is_expected.to validate_inclusion_of(:status).in_array(SalesOrderDocument::STATUSES)}
end
