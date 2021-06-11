require 'BigDecimal'
require './lib/helpers/entities_helper'
require 'byebug'

module Entities
  class Product
    include EntitiesHelper

    attr_accessor :name, :price, :category, :tax

    def initialize(name, price)
      @name = name
      @price = to_decimal(price)
      initialize_category
    end

    def initialize_category
      foods_vocabulary_collection = read_file('data/foods.txt')
      medicals_vocabulary_collection = read_file('data/medicals.txt')
      @category = if match_pattern(@name, foods_vocabulary_collection)
                    'food'
                  elsif match_pattern(@name, medicals_vocabulary_collection)
                    'medical'
                  else
                    'taxable'
                  end
    end
  end
end
