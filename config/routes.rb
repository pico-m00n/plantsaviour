Rails.application.routes.draw do
  resources :questions
  devise_for :end_users
  root 'questions#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
