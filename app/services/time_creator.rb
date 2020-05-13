# frozen_string_literal: true

class TimeCreator
  def initialize(params)
    @params = params.to_enum.to_h
  end

  attr_reader :params

  def self.create(params)
    new(params).create
  end

  def create
    time_args = params.each_with_object([]) do |(key, value), acc|
      acc << value if key.match?('expire_time')
    end

    Time.new(*time_args)
  end
end
