# frozen_string_literal: true

require_relative "subscriber/version"
require_relative "subscriber/line_item"
require_relative "subscriber/sales_tax_checker"

module Subscriber
  class Error < StandardError; end

  def self.[](string)
    line_items = parse(string)
    sales_taxes = line_items.sum(&:taxes)
    total = line_items.sum(&:total)

    line_items.each do |line_item|
      puts line_item
    end
    puts "Sales Taxes: #{sales_taxes}"
    puts "Total: #{total}"
  end

  def self.parse(input)
    input.split("\n").map do |string|
      first_part, second_part = string.strip.split(" at ")
      quantity = first_part[0].to_i
      type = first_part.chars.drop(1).join.strip
      price = second_part.to_f

      LineItem.new(quantity.to_i, type, price.to_f)
    end
  end
end
