# frozen_string_literal: true

class CurrentRateDisplayJob < ApplicationJob
  queue_as :default

  def perform
    rate = ExchangeRate.actual_rate
    ActionCable.server.broadcast 'fetch', { rate: rate }
  end
end
