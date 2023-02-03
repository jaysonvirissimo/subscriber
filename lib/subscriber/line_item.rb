# frozen_string_literal: true

module Subscriber
  class LineItem
    SALES_TAX = 0.10 # 10%
    attr_reader :quantity, :type, :price

    def initialize(quantity, type, price)
      @quantity = quantity
      @type = type
      @price = price
    end

    def sales_tax
      (quantity * price * SALES_TAX).round(2)
    end
  end
end
