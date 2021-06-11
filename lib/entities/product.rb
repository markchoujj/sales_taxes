require 'BigDecimal'
require './lib/helpers/entities_helper'
require 'byebug'

module Entities
  class Product
    include EntitiesHelper

    attr_accessor :name, :price, :category, :tax, :is_import

    def initialize(name, price)
      @name = name
      @price = to_decimal(price)
      @tax = 0
      initialize_category
      initialize_import
    end

    def initialize_category
      foods_vocabulary_collection = read_file('data/foods.txt')
      medicals_vocabulary_collection = read_file('data/medicals.txt')
      books_vocabulary_collection = ['book']
      @category = if match_pattern(@name, foods_vocabulary_collection)
                    'food'
                  elsif match_pattern(@name, medicals_vocabulary_collection)
                    'medical'
                  elsif match_pattern(@name, books_vocabulary_collection)
                    'book'
                  else
                    'taxable'
                  end
    end

    def initialize_import
      pattern_collection = %w[import imported]
      @is_import = match_pattern(@name, pattern_collection)
    end
  end
end
