require 'BigDecimal'
require 'active_support/inflector'

module EntitiesHelper
  COMMON_WORDS = %w[of in on to a an the this at over from up down by with
                    it].freeze

  def to_decimal(number)
    BigDecimal(number.to_s)
  end

  def match_pattern(name, word_collection)
    words = remove_common_words(name.split(' '))
    result = false
    words.each do |word|
      result ||= word_collection.any? { |s| s[word.singularize.downcase] }
    end
    result
  end

  def read_file(file_path)
    raw_data = File.readlines(file_path)
    raw_data.map(&:strip)
  end

  def remove_common_words(words)
    words - COMMON_WORDS
  end
end
