Dir['./lib/entities/*.rb'].sort.each { |file| require file }
require './lib/helpers/decimals_helper'

module Services
  class OutputResults
    class << self
      include DecimalsHelper

      def call!(deal)
        decorated_deal = Decorators::DealDecorator.new(deal)
        output_orders(deal)
        puts ''
        puts "Sales Taxes: #{decorated_deal.total_tax}"
        puts "Total: #{decorated_deal.total_price}"
      end

      def output_orders(deal)
        deal.orders.each do |order|
          puts "#{order.quantity}, #{order.product.name}, #{decimal_formatter(order.total_price)}"
        end
      end
    end
  end
end
