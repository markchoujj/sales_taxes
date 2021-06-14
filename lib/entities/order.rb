module Entities
  class Order
    attr_accessor :product, :quantity, :tax, :total_price, :price

    def initialize(product, quantity)
      @product = product
      @quantity = quantity.to_i
      @tax = 0
      @price = 0
      @total_price = 0
    end
  end
end
