# frozen_string_literal: true

require_relative './reader'

# Class for Consumption
class Consumption < Reader
  # return total usage for an average house
  def calculate
    { usage: read.sum { |row| row[:usage].to_i * 1000 } }
  end
end
