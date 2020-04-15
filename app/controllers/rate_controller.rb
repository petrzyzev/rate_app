# frozen_string_literal: true

require 'net/http'
require 'json'

class RateController < ApplicationController
  include RateHelper

  def show
    uri = URI('https://www.cbr-xml-daily.ru/daily_json.js')
    @json = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
    render :show
  end

  def admin; end

  def submit
    p params
  end
end
