Dir['./lib/**/*.rb'].sort.each { |file| require file }
require 'active_support'
require 'byebug'

class TaxesCalculator
  class << self
    include DecimalsHelper
    def call!
      puts 'Quantity, Product, Price'
      @deal = Entities::Deal.new
      loop do
        input = gets.chomp
        break if input == ''

        @qty, @name, @price = input.split(',')
        analyse_product
        analyse_order
      end
      analyse_deal
      output_deal_infos
    end

    def analyse_product
      @product = Entities::Product.new(@name, @price)
      Services::CalculateProductTaxes.call!(@product)
    end

    def analyse_order
      @order = Entities::Order.new(@product, @qty)
      Services::CalculateOrder.call!(@order)
      @deal.orders << @order
    end

    def analyse_deal
      Services::CalculateDeal.call!(@deal)
    end

    def output_deal_infos
      Services::OutputResults.call!(@deal)
    end

    def output_orders
      @deal.orders.each do |order|
        puts "#{order.quantity}, #{order.product.name}, #{decimal_formatter(order.total_price)}"
      end
    end
  end
end
