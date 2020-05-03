# frozen_string_literal: true
require_relative '../../config/application'

namespace :rate_app do
  desc 'Synchronize the exchange rate'
  task fetch_rate: :environment do
    RateFetcher.fetch
  end
end
