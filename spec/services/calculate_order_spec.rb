require 'spec_helper'

describe Services::CalculateProductTaxes do
  build_orders

  before do
    chocolate.tax = 1
    Services::CalculateOrder.call!(chocolates_order)
  end

  it 'calculate order taxes' do
    expect(chocolates_order.tax).to eq 2
  end

  it 'calculate order total price' do
    expect(chocolates_order.total_price).to eq 20.3
  end
end
