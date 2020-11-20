# frozen_string_literal: true

require_relative './reader'

# Class for Consumption
class Consumption < Reader
  def calculate
    result = {}

    read.each do |row|
      current_usage = result['usage'].to_i
      usage = row[1].to_i * 1000
      result['usage'] = current_usage + usage
    end

    result
  end
end
