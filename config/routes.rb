Rails.application.routes.draw do
  resources :categories do
    resources :cards
  end
  devise_for :users
  get 'welcome/index'
 
  root 'welcome#index'
  
  get 'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'
  get 'auth/twitter', :as => 'login'
  
  post '/cards/:id/answer' => 'cards#answer', :as => :card_answer
  
  post '/cards/:id/next_card' => 'cards#next_card', :as => :next_card
  
end