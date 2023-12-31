require 'rails_helper'

RSpec.describe SupplierFormula, type: :model do
  it 'has a valid factory' do
    expect(build(:supplier_formula)).to be_valid
  end
  
  it { should validate_presence_of(:active)}
  it { should validate_presence_of(:margin)}

  it { is_expected.to(validate_numericality_of(:margin).is_greater_than(0)) }
  it { should belong_to(:supplier)}


end
