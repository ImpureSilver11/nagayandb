Rails.application.routes.draw do
  resources :entertainers do
    resources :images, controller: 'entertainers/images'
  end
  resources :tags do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
