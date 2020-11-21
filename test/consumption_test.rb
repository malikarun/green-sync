# frozen_string_literal: true

require_relative './test_helper'

class ConsumptionTest < Minitest::Test
  def setup
    @consumption = Consumption.new('./data/02-consumption.csv')
  end

  def test_it_can_calculate
    assert_equal @consumption.calculate.length, 1
  end

  def test_it_should_return_usage
    assert_equal @consumption.calculate, { usage: 125_000 }
  end
end
