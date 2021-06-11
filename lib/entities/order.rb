module Entities
  class Order
    attr_accessor :product, :quantity, :tax

    def initialize(product, quantity)
      @product = product
      @quantity = quantity.to_i
      @tax = 0
    end
  end
end
