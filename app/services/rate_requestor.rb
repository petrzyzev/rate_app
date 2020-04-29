# frozen_string_literal: true

class RateRequestor
  def rate
    uri = URI('https://www.cbr-xml-daily.ru/daily_json.js')
    json = JSON.parse(Net::HTTP.get(uri))
    json.dig('Valute', 'USD', 'Value')&.to_f
  end
end
