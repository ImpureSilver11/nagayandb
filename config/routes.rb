# frozen_string_literal: true

Rails.application.routes.draw do
  match '*path' => 'options_request#preflight', via: :options

  get '/' => 'home#index'
  resources :entertainers do
    resources :images, controller: 'entertainers/images'
  end
  resources :tags do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
