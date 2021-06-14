Dir['./lib/entities/*.rb'].sort.each { |file| require file }
require './lib/helpers/services_helper'

module Services
  class CalculateDeal
    class << self
      include ServicesHelper

      def call!(deal)
        deal.total_tax, deal.total_price = sum_up_tax_n_price(deal)
      end

      def sum_up_tax_n_price(deal)
        price = deal.orders.sum(&:total_price)
        tax = deal.orders.sum(&:tax)
        [tax, price]
      end
    end
  end
end
