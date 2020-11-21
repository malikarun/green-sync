# frozen_string_literal: true

require_relative './test_helper'

class InformationTest < Minitest::Test
  def setup
    @information = Information.new('./data/03-household_information.csv')
  end

  def test_it_can_calculate
    assert_equal @information.calculate.length, 3
  end

  def test_it_should_return_usage
    assert_equal @information.calculate.first, {
      house_id: '1',
      number_of_occupants: '3',
      cost_per_kilowatt_hour: '$0.25'
    }
  end
end
