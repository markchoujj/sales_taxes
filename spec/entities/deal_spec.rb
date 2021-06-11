require 'spec_helper'

describe Entities::Deal do
  build_deal

  context 'attributes' do
    it { is_expected.to have_attr_accessor(:orders) }
    it { is_expected.to have_attr_accessor(:total_price) }
    it { is_expected.to have_attr_accessor(:total_tax) }
  end

  it 'default attributes' do
    expect(deal.orders).to eq []
    expect(deal.total_price).to eq 0
    expect(deal.total_tax).to eq 0
  end
end
