Dir['./lib/entities/*.rb'].sort.each { |file| require file }
require './lib/helpers/services_helper'

module Services
  class CalculateDeal
    include ServicesHelper

    def self.call!(deal)
      deal.total_tax, deal.total_price = sum_up_tax_n_price(deal)
    end

    def self.sum_up_tax_n_price(deal)
      price = deal.orders.sum(&:total_price)
      tax = deal.orders.sum(&:tax)
      tax_rounded = ServicesHelper.round_tax(tax)
      [tax_rounded, price]
    end
  end
end