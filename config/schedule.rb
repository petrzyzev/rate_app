# frozen_string_literal: true

env :PATH, ENV['PATH']

every 1.minute do
  rake 'rate_app:fetch_rate'
end