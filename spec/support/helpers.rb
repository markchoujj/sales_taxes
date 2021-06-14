Dir['./lib/**/*.rb'].sort.each { |file| require file }
require_relative '../custom/matchers/should_have_attr_accessor'

module Helpers
  def build_products
    subject(:chocolate) { Entities::Product.new('chocolate', 10.15) }
    subject(:perfume) { Entities::Product.new('perfume', 20.25) }
    subject(:imported_chocolate) { Entities::Product.new('imported box of chocolates', 30.35) }
    subject(:imported_perfume) { Entities::Product.new('bottle of perfume', 40.45) }
    subject(:pill) { Entities::Product.new('packet of headache pills', 9.75) }
  end

  def build_orders
    build_products
    subject(:chocolates_order) { Entities::Order.new(chocolate, 2) }
    subject(:perfumes_order) { Entities::Order.new(perfume, 2) }
    subject(:imported_chocolates_order) { Entities::Order.new(imported_chocolate, 2) }
    subject(:imported_perfumes_order) { Entities::Order.new(imported_perfume, 2) }
  end

  def build_deal
    subject(:deal) { Entities::Deal.new }
  end

  def build_decorated_deal
    build_deal
    subject(:decorated_deal) { Decorators::DealDecorator.new(deal) }
  end
end
