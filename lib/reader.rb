# frozen_string_literal: true

require 'csv'

# Class for Information
class Reader
  def initialize(file)
    @file = file
  end

  def read
    raise 'Please enter a valid file' unless File.exist?(@file)

    CSV.parse(File.read(@file), headers: true)
  end
end
