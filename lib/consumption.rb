# frozen_string_literal: true

require_relative './reader'

# Class for Consumption
class Consumption < Reader
  def calculate
    result = {}

    self.read.each do |row|
      currentUsage = result[:usage].to_i
      usage = row[1].to_i * 1000
      result[:usage] = currentUsage + usage
    end

    result
  end
end
