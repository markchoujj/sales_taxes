require 'spec_helper'

describe Services::CalculateProductTaxes do
  build_products
  before do
    Services::CalculateProductTaxes.call!(imported_chocolate)
    Services::CalculateProductTaxes.call!(perfume)
  end

  it 'generate right general tax' do
    expect(chocolate.tax).to eq 0
    expect(perfume.tax).to eq 2.025
  end

  it 'generate right import tax' do
    expect(imported_chocolate.tax).to eq 1.5175
    expect(perfume.tax).to eq 2.025
  end
end
