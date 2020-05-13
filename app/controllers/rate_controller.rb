# frozen_string_literal: true

class RateController < ApplicationController
  def show; end

  def admin
    @time_args = convert_time
    @forced_rate = rate_data[:forced_rate]
  end

  def submit
    new_rate_data = {
      forced_rate: params[:forced_rate],
      expire_time: TimeCreator.create(params)
    }

    Storage.save_to_file(new_rate_data)
  end

  private

  SYMBOLS = %i[second minute hour day month year].freeze

  def rate_data
    Storage.rate_data
  end

  def convert_time
    expire_time = rate_data[:expire_time].to_a

    SYMBOLS.each.with_index.with_object({}) do |(v, i), hash|
      hash[v] = expire_time[i]
    end
  end
end
