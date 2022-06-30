Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  
  #/@user/story.title
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  #/@user
  get '@:username', to: 'pages#user', as: 'user_page'

  resources :stories

  root "pages#index"
end
