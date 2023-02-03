require "set"

module Subscriber
  class SalesTaxChecker
    def initialize(type)
      @type = type.gsub("imported", "").strip
    end

    def exempt?
      (BOOKS | FOOD | MEDICAL_PRODUCTS).member?(type)
    end

    private

    attr_reader :type

    BOOKS = [
      "book"
    ].to_set.freeze

    FOOD = [
      "chocolate bar",
      "box of chocolates"
    ].to_set.freeze

    MEDICAL_PRODUCTS = [
      "headache pills"
    ].to_set.freeze
  end
end
