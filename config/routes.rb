Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  
  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_scope :user do
    post 'public/users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :index, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follows', as: 'follows'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :trainings, only: [:show, :edit, :index, :new, :create, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :training_comments, only: [:create, :destroy]
      collection do
        get :likes
      end
    end
    resources :chats, only: [:show, :create]
    get 'search' => 'searches#search'
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :trainings, only: [:index]
  end
end
