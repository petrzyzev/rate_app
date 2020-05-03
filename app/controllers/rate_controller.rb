# frozen_string_literal: true

class RateController < ApplicationController
  def show; end

  def admin
    @expire_time = rate_data[:expire_time]
    @forced_rate = rate_data[:forced_rate]
  end

  def submit
    new_rate_data = {
      forced_rate: params[:forced_rate],
      expire_time: params[:expire_time]
    }

    Storage.save_to_file(new_rate_data)

    rate = ExchangeRate.actual_rate
    ActionCable.server.broadcast 'fetch', { rate: rate }

    CurrentRateDisplay.display(params[:expire_time].to_time)
  end

  private

  def rate_data
    Storage.rate_data
  end
end
