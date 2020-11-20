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

  def calculate
    consumption = @consumption.calculate
    generation = @generation.calculate

    result = @information.calculate.map do |house|
      house['generation'] = generation[house['house_id']]
      house['consumption'] = consumption['usage']
      house.to_hash
    end

    p result
  end
end
