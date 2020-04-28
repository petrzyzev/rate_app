# frozen_string_literal: true
require_relative '../../config/application'

namespace :rate_app do
  desc 'Synchronize the exchange rate'
  task fetch_rate: :environment do
    uri = URI('https://www.cbr-xml-daily.ru/daily_json.js')
    json = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
    dollar_rate = json[:Valute][:USD][:Value]
    Storage.save_to_file(current_rate: dollar_rate)
  end
end
