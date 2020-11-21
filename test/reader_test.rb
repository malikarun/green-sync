# frozen_string_literal: true

require_relative './test_helper'

class ReaderTest < Minitest::Test
  def setup
    @reader = Reader.new('./data/03-household_information.csv')
  end

  def test_it_raises_exception_without_correct_file
    reader = Reader.new('wrong_file.csv')
    assert_raises 'Argument error' do
      reader.send(:read)
    end
  end

  def test_it_should_return_file_data
    data = @reader.send(:read)
    assert_equal data.first, { house_id: '1', number_of_occupants: '3', cost_per_kilowatt_hour: '$0.25' }
  end

  def test_it_should_convert_hash_to_sym
    hash = { 'hi' => 'hello' }
    symbol = @reader.send(:row_to_sym, hash)
    assert_equal symbol, { hi: 'hello' }
  end
end
