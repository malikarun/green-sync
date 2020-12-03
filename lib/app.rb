# frozen_string_literal: true

require_relative './consumption'
require_relative './generation'
require_relative './information'

# Main App Class for the program
class App
  def initialize(generation, consumption, information)
    if !generation || !consumption || !information
      raise 'Please provide path for all data files i.e. generation, consumption, information'
    end

    @consumption = Consumption.new(consumption)
    @generation = Generation.new(generation)
    @information = Information.new(information)
  end

  def report
    calculate.each do |house|
      p "House #{house[:house_id]} generated #{house[:generation]}Wh of electricity"
      p "House #{house[:house_id]} consumed #{house[:consumption]}Wh of electricity"
      p "House id: #{house[:house_id]} averaged $#{calculate_cost(house)} per person"
    end
  end

  private

  def calculate
    @information.calculate.map do |house|
      house.merge({ generation: @generation.calculate[house[:house_id]], consumption: @consumption.calculate[:usage] })
    end
  end

  def calculate_cost(house)
    cost_per_kh = house[:cost_per_kilowatt_hour].gsub(/[^\d.]/, '').to_f
    occupants = house[:number_of_occupants].to_i
    # calculate cost per person
    (house[:consumption] * cost_per_kh / 1000 / occupants).round(2)
  end
end
