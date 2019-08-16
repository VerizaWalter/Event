Rails.application.routes.draw do

  root to: 'events#index'
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :events do
   resources :attendances
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
