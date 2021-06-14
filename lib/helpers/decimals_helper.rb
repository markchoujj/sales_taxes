require 'BigDecimal'
module DecimalsHelper
  def decimal_formatter(decimal)
    format('%.2f', decimal)
  end
end
