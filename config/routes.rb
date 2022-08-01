Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  namespace :api do
    #/users/:id/follow
    resources :users, only: [] do
      member do 
        post :follow
      end
    end
    
    resources :stories, only: [] do
      member do             #以 member 的方法新增 clap 的POST的動作
        post :clap
        post :bookmark
      end
    end


  end
  
  resources :stories do
    resources :comments, only: [:create]
  end

  #/@user/story.title
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  #/@user
  get '@:username', to: 'pages#user', as: 'user_page'
  get '/demo', to: 'pages#demo'
  resources :stories

  root "pages#index"
end