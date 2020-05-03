# frozen_string_literal: true

Rails.application.routes.draw do
  get '/' => 'rate#show'
  get '/admin' => 'rate#admin'
  post '/submit' => 'rate#submit'
  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
