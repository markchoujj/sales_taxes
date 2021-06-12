require 'BigDecimal'

module ServicesHelper
  class << self
    def round_tax(number)
      rounded = to_decimal((number * 20).round.to_f / 20)
      rounded += 0.05 if rounded < number
      rounded
    end

    def to_decimal(number)
      BigDecimal(number.to_s)
    end
  end
end
