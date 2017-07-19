Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :batch_uploads, only: [:new,:create]
  resources :auctions, only: [:index]
  root "application#index"
end
