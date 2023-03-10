# frozen_string_literal: true

module Subscriber
  class LineItem
    IMPORT_DUTY = 0.05 # 5%
    ROUNDING_VALUE = 20
    SALES_TAX = 0.10 # 10%
    attr_reader :quantity, :type, :price

    def initialize(quantity, type, price)
      @quantity = quantity
      @type = type
      @price = price
    end

    def import_duty
      if qualifies_for_duty?
        (quantity * price * IMPORT_DUTY).round(2)
      else
        0
      end
    end

    def sales_tax
      if SalesTaxChecker.new(type).exempt?
        0
      else
        (quantity * price * SALES_TAX).round(2)
      end
    end

    def taxes
      ((import_duty + sales_tax) * ROUNDING_VALUE).ceil / ROUNDING_VALUE.to_f
    end

    def total
      (quantity * price + taxes).round(2)
    end

    def to_s
      "#{quantity} #{type}: #{sprintf("%.2f", total)}"
    end

    private

    def qualifies_for_duty?
      type.include?("imported")
    end
  end
end
