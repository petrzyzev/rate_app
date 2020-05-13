# frozen_string_literal: true

class ExchangeRate
  def self.actual_rate
    new.actual_rate
  end

  def actual_rate
    return forced_rate if forced_rate?

    current_rate
  end

  def forced_rate?
    forced_rate && expire_time >= Time.now
  end

  def forced_rate
    rate_data[:forced_rate]
  end

  def expire_time
    rate_data[:expire_time]
  end

  def current_rate
    rate_data[:current_rate]
  end

  def rate_data
    Storage.rate_data
  end
end
