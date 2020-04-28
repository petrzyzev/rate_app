# frozen_string_literal: true

class FetchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fetch'
  end
end
