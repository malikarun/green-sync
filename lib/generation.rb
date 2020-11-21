# frozen_string_literal: true

require_relative './reader'

# Class for Solar Generation
class Generation < Reader
  def calculate
    result = {}

    read.each do |row|
      current_watt_hours = result[row[:house_id]].to_i
      watt_hour = row[:power_real].to_i / 12
      result[row[:house_id]] = current_watt_hours + watt_hour
    end

    result
  end
end
