Rails.application.routes.draw do
  namespace :public do
    get 'rooms/show'
  end
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
    root :to => 'homes#top'
    get 'select' => 'homes#select'
    resources :users, only: [:show, :edit, :index, :update, :destroy] do
      resources :reports, only: [:new, :create]
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#followings', as: 'followings'
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
    resources :plans, only: [:index, :create, :edit, :update] do 
        collection do 
           get :working
        end
      patch "week_enables" => "week_enables#update"
      delete "week_enables" => "week_enables#destroy"
      
      collection do
        patch "week_enable/update_all" => "week_enables#update_all" , as: "week_update_all"
        delete "week_enable/destroy_all" => "week_enables#destroy_all" , as: "week_destroy_all"
      end
        resources :week_enables, only: [:create]
    end
    resources :merits, only: [:index, :create, :edit, :update]
    resources :causes, only: [:index, :create, :edit, :update]
  
    get 'search' => 'searches#search'
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :trainings, only: [:index, :destroy]
    resources :reports, only: [:index]
  end
end
