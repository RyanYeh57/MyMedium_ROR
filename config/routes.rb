Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  
  resources :stories do
    member do             #以 member 的方法新增POST的動作
      post :clap
    end
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