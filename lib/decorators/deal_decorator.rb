require './lib/helpers/decimals_helper'
require 'delegate'

module Decorators
  class DealDecorator < SimpleDelegator
    include DecimalsHelper
    # attr_reader :deal, :total_price, :total_tax

    def initialize(deal)
      @deal = deal
      super
    end

    def total_price
      decimal_formatter(@deal.total_price)
    end

    def total_tax
      decimal_formatter(@deal.total_tax)
    end
  end
end
