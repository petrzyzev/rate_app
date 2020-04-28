# frozen_string_literal: true

class RateController < ApplicationController
  def show
    @expire_time = rate_data[:expire_time]
    @rate = if @expire_time.to_time >= Time.now
      rate_data[:forced_rate]
    else
      rate_data[:current_rate]
    end
  end

  def admin
    @expire_time = rate_data[:expire_time]
    @current_rate = rate_data[:current_rate]
    @forced_rate = rate_data[:forced_rate]
  end

  def submit
    new_rate_data = {
      forced_rate: params[:forced_rate],
      expire_time: params[:expire_time]
    }

    Storage.save_to_file(new_rate_data)

    displayed_rate = if rate_data[:expire_time].to_time >= Time.now
      rate_data[:forced_rate]
    else
      rate_data[:current_rate]
    end

    ActionCable.server.broadcast 'fetch', { rate: displayed_rate }
  end

  private

  def rate_data
    Storage.rate_data
  end
end
