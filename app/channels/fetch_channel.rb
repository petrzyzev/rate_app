# frozen_string_literal: true

class FetchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fetch'
  end

  def send_rate
    rate = ExchangeRate.actual_rate || RateFetcher.fetch
    ActionCable.server.broadcast 'fetch', { rate: rate }
  end
end
