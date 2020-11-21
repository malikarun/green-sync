# frozen_string_literal: true

require 'csv'

# Class for Information
class Reader
  def initialize(file)
    @file = file
  end

  private

  # read the csv and parse it with key value pairs
  def read
    raise 'Please enter a valid file' unless File.exist?(@file)

    CSV.parse(File.read(@file), headers: true).map { |row| row_to_sym row }
  end

  # convert a row from hash to sym for better readability
  def row_to_sym(row)
    Hash[row.to_hash.map { |k, v| [k.to_sym, v] }]
  end
end
