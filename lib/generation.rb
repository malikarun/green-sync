# frozen_string_literal: true

require_relative './reader'

# Class for Solar Generation
class Generation < Reader
  def calculate
    result = {}

    read.each do |row|
      current_watt_hours = result[row[2]].to_i
      watt_hour = row[1].to_i / 12
      result[row[2]] = current_watt_hours + watt_hour
    end

    result
  end
end
