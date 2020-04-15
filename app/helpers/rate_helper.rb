# frozen_string_literal: true

module RateHelper
  def chache
    @chache ||= ActiveSupport::Cache::MemoryStore.new
  end
end
