# frozen_string_literal: true

require_relative "subscriber/version"

module Subscriber
  class Error < StandardError; end

  def self.parse(input)
    input.split(", ").map do |string|
      first_part, second_part = string.strip.split(" at ")
      quantity, type = first_part.split(" ")
      price = second_part 

      LineItem.new(quantity.to_i, type, price.to_f)
    end
  end

  private

  LineItem = Struct.new(:quantity, :type, :price)
end
