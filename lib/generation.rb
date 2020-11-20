# frozen_string_literal: true

require_relative './reader'

# Class for Solar Generation
class Generation < Reader
  def calculate
    result = {}

    self.read.each do |row|
      currentWattHours = result[row[2]].to_i
      wattHour = row[1].to_i / 12
      result[row[2]] = currentWattHours + wattHour
    end

    result
  end
end
