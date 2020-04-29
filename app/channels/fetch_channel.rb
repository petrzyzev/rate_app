# frozen_string_literal: true

class FetchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fetch'
  end

  def send_rate
    rate = exchange_rate.fetch
    ActionCable.server.broadcast 'fetch', { rate: rate }
  end

  private

  def exchange_rate
    rate_requestor = RateRequestor.new
    rate_fetcher = RateFetcher.new(rate_requestor: rate_requestor)
    ExchangeRate.new(rate_fetcher: rate_fetcher)
  end
end
