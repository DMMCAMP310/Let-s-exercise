Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  
  devise_scope :user do
    post 'public/users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end
  
  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :index, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follows', as: 'follows'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :trainings, only: [:show, :edit, :index, :new, :create, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :training_comments, only: [:crete, :destroy]
    end
    resources :chats, only: [:show, :create]
    get 'search' => 'searches#search'
  end
  
  namespace :admin do
    resources :users, only: [:show]
  end
end
