# frozen_string_literal: true

class RateFetcher
  def initialize(rate_requestor:)
    @rate_requestor = rate_requestor
  end

  attr_accessor :rate_requestor

  def self.fetch
    new(rate_requestor: RateRequestor.new).fetch
  end

  def fetch
    rate = request_rate
    Storage.save_to_file(current_rate: rate)
  end

  def request_rate
    rate_requestor.rate
  end
end
