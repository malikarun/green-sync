# frozen_string_literal: true

require_relative '../lib/app'

require 'minitest/autorun'
require 'simplecov'

SimpleCov.start

describe App do
  before do
    @app = App.new
  end

  it 'should place on right coord' do
    assert_equal 'hello', @app.calculate
  end
end
