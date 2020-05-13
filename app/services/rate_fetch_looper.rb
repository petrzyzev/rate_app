# frozen_string_literal: true

class RateFetchLooper
  def self.run
    Thread.new do
      loop do
        RateFetcher.fetch
        sleep 1.minutes
      end
    end
  end
end
