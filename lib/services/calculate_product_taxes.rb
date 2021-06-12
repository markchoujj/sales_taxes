Dir['./lib/entities/*.rb'].sort.each { |file| require file }

module Services
  class CalculateProductTaxes
    def self.call!(product)
      calculate_general_tax(product)
      calculate_import_tax(product)
    end

    def self.calculate_general_tax(product)
      product.tax += product.price * 0.1 if product.category == 'taxable'
    end

    def self.calculate_import_tax(product)
      product.tax += product.price * 0.05 if product.is_import
    end
  end
end