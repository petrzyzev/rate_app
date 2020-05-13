# frozen_string_literal: true

class RatePusher
  def self.run
    Thread.new do
      loop do
        sleep 1.second
        rate = ExchangeRate.actual_rate
        ActionCable.server.broadcast 'fetch', { rate: rate }
      end
    end
  end
end
