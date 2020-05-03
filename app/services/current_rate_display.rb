# frozen_string_literal: true
require_relative '../jobs/current_rate_display_job.rb'

class CurrentRateDisplay
  def self.display(time)
    CurrentRateDisplayJob.set(wait_until: time).perform_later
  end
end
