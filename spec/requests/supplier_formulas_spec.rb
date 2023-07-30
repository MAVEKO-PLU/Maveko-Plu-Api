require 'rails_helper'

RSpec.describe "SupplierFormulas", type: :request do
  include_examples('request_shared_spec', 'supplier_formulas', 7)

  let(:valid_attributes) do
    {
      margin: 12.3,
      active: true,
      label: "label",
      supplier_id: create(:supplier).id
    }
  end

  let(:invalid_attributes) do
    {
      margin: nil,
      active: nil,
      label: "label",
      supplier_id: create(:supplier).id
    }
  end

  let(:new_attributes) do
    {
      margin: 11.2,
    }
  end    
    
end
