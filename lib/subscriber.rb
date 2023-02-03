# frozen_string_literal: true

require_relative "subscriber/version"
require_relative "subscriber/line_item"

module Subscriber
  class Error < StandardError; end

  def self.parse(input)
    input.split(", ").map do |string|
      first_part, second_part = string.strip.split(" at ")
      quantity = first_part.chars[0].to_i
      type = first_part.chars.drop(1).join.strip
      price = second_part.to_f

      LineItem.new(quantity.to_i, type, price.to_f)
    end
  end
end
