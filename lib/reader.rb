# frozen_string_literal: true

require 'csv'

# Class for Information
class Reader
  def initialize(file)
    @file = file
  end

  def read
    if File.exist?(@file)
      CSV.parse(File.read(@file), headers: true)
    else
      raise 'Please enter a valid file'
    end
  end
end
