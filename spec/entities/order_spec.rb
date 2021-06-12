require 'spec_helper'

describe Entities::Order do
  build_orders

  context 'attributes' do
    it { is_expected.to have_attr_accessor(:quantity) }
    it { is_expected.to have_attr_accessor(:product) }
    it { is_expected.to have_attr_accessor(:tax) }
    it { is_expected.to have_attr_accessor(:total_price) }
  end

  it 'default attributes' do
    expect(chocolates_order.tax).to eq 0
  end
end
