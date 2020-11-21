# frozen_string_literal: true

require_relative './test_helper'

class AppTest < Minitest::Test
  def test_it_raises_argument_exception_without_params
    assert_raises 'Argument error' do
      App.new
    end
  end

  def test_it_raises__argument_exception_with_one_params
    assert_raises 'Argument error' do
      App.new('./data/01-solar_generation.csv')
    end
  end

  def test_it_raises_argument_exception_with_two_params
    assert_raises 'Argument error' do
      App.new('./data/01-solar_generation.csv', './data/02-consumption.csv')
    end
  end

  def test_it_can_calculate
    app = App.new('./data/01-solar_generation.csv', './data/02-consumption.csv', './data/03-household_information.csv')
    assert_equal app.send(:calculate).length, 3
  end

  def test_it_can_calculate_cost
    app = App.new('./data/01-solar_generation.csv', './data/02-consumption.csv', './data/03-household_information.csv')
    houses = app.send(:calculate)
    assert_equal app.send(:calculate_cost, houses.first), 10.42
  end

  def test_it_can_calculate_cost_should_round_to_2
    app = App.new('./data/01-solar_generation.csv', './data/02-consumption.csv', './data/03-household_information.csv')
    houses = app.send(:calculate)
    cost = app.send(:calculate_cost, houses.first)
    assert_equal cost, cost.round(2)
  end
end
