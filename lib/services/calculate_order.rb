Dir['./lib/entities/*.rb'].sort.each { |file| require file }

module Services
  class CalculateOrder
    def self.call!(order)
      order.tax = sum_up_tax(order)
      order.total_price = sum_up_price(order)
    end

    def self.sum_up_tax(order)
      order.product.tax * order.quantity
    end

    def self.sum_up_price(order)
      order.product.price * order.quantity
    end
  end
end