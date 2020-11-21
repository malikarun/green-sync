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
      consumption = house[:consumption]

      # cost per person
      cost = (consumption * house[:cost_per_kilowatt_hour])  / ( 1000 / house[:number_of_occupants])

      p "House #{house[:house_id]} generated #{house[:generation]}Wh of electricity"
      p "House #{house[:house_id]} consumed #{consumption}Wh of electricity"
      p "House id: #{house[:house_id]} averaged $#{cost} per person"
    end
  end

  private

  def calculate
    consumption = @consumption.calculate
    generation = @generation.calculate

    @information.calculate.map do |house|
      house.merge({ generation: generation[house[:house_id]], consumption: consumption[:usage] })
    end
  end
end
