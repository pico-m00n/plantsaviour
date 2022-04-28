Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#top'
  devise_for :end_users
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  resources :posts do
    resource :bookmarks, only: [:create, :destroy]
  end

  resources :end_users, only: [:show, :edit, :update]
  resources :questions, shallow: true  do
    resource :bookmarks, only: [:create, :destroy]
    resources :answers, shallow: true,  only: [:new, :create] do
      resources :reactions, only: [:new, :create]
    end
  end

  get 'homes/top' => "home#top"
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
