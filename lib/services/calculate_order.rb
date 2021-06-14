Dir['./lib/entities/*.rb'].sort.each { |file| require file }

module Services
  class CalculateOrder
    class << self
      include ServicesHelper

      def call!(order)
        order.tax = round_order_tax(sum_up_tax(order))
        order.price = sum_up_price(order)
        order.total_price = order.tax + order.price
      end

      def sum_up_tax(order)
        order.product.tax * order.quantity
      end

      def round_order_tax(tax)
        round_tax(tax)
      end

      def sum_up_price(order)
        order.product.price * order.quantity
      end
    end
  end
end