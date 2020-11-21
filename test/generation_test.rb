# frozen_string_literal: true

require_relative './test_helper'

class GenerationTest < Minitest::Test
  def setup
    @generation = Generation.new('./data/01-solar_generation.csv')
  end

  def test_it_can_calculate
    assert_equal @generation.calculate.length, 3
  end

  def test_it_should_return_usage
    assert_equal @generation.calculate['1'], 202_006
  end
end
