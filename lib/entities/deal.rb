module Entities
  class Deal
    attr_accessor :orders, :total_price, :total_tax

    def initialize
      @orders = []
      @total_price = 0.0
      @total_tax = 0.0
    end
  end
end
