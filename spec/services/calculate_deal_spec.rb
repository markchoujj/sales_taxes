require 'spec_helper'

describe Services::CalculateDeal do
  build_deal
  build_orders

  before do
    # Make up some price and tax for rounding rule check
    chocolates_order.total_price = 10.21
    chocolates_order.tax = 1.23
    perfumes_order.total_price = 20.25
    perfumes_order.tax = 2.33
    deal.orders += [chocolates_order, perfumes_order]
    Services::CalculateDeal.call!(deal)
  end

  it 'calculates total tax' do
    # Totol tax = 1.23 + 2.33 = 3.56, round to 3.6
    expect(deal.total_tax).to eq 3.6
  end

  it 'it calculates total price' do
    # total price = 10.21 + 20.25 = 30.46
    expect(deal.total_price).to eq 30.46
  end
end
