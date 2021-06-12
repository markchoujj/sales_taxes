require 'spec_helper'

describe Entities::Product do
  build_products

  context 'attributes' do
    it { is_expected.to have_attr_accessor(:name) }
    it { is_expected.to have_attr_accessor(:price) }
    it { is_expected.to have_attr_accessor(:category) }
    it { is_expected.to have_attr_accessor(:tax) }
    it { is_expected.to have_attr_accessor(:is_import) }
  end

  it 'assigns category' do
    expect(chocolate.category).to eq 'food'
    expect(pill.category).to eq 'medical'
  end

  it 'assign import' do
    expect(chocolate.is_import).to eq false
    expect(imported_chocolate.is_import).to eq true
  end

  it 'default attributes' do
    expect(chocolate.tax).to eq 0
  end
end
