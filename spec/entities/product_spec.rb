require 'spec_helper'

describe Entities::Product do
  build_products

  context 'attributes' do
    it { is_expected.to have_attr_accessor(:name) }
    it { is_expected.to have_attr_accessor(:price) }
    it { is_expected.to have_attr_accessor(:category) }
    it { is_expected.to have_attr_accessor(:tax) }
  end

  it 'assigns category' do
    expect(chocolate.category).to eq 'food'
    expect(pill.category).to eq 'medical'
  end
end
