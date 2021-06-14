require 'spec_helper'

describe Decorators::DealDecorator do
  build_decorated_deal

  before do
    deal.total_price = 12.234
    deal.total_tax = 2.3
  end

  it 'formats tax and price' do
    expect(decorated_deal.total_price).to eq '12.23'
    expect(decorated_deal.total_tax).to eq '2.30'
  end
end
