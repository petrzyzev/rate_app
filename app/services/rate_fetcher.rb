# frozen_string_literal: true

class RateFetcher
  def initialize(rate_requestor:)
    @rate_requestor = rate_requestor
  end

  attr_accessor :rate_requestor

  def fetch
    Rails.cache.fetch('external_rate', expires_in: 1.minute) { request_rate }
  end

  def request_rate
    rate_requestor.rate
  end
end
