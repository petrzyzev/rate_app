# frozen_string_literal: true

class ExchangeRate
  def initialize(rate_fetcher:)
    @rate_fetcher = rate_fetcher
  end

  attr_accessor :rate_fetcher

  def fetch
    return forced_rate if forced_rate?

    fetch_rate
  end

  def forced_rate?
    # TODO: forced_rate?
    false
  end

  def forced_rate
    # TODO: вэрнуть forced_rate
  end

  def fetch_rate
    rate_fetcher.fetch
  end
end
