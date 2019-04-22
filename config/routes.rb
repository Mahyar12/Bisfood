require 'api_constraints'

Rails.application.routes.draw do
  
  # resources :user_cups
  # resources :game_profiles
  # resources :user_answers
  # resources :user_competitions
  # resources :competitions
  # resources :currency_packs
  # resources :cups
  # resources :friends
  # resources :messages
  # resources :chats
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post '/users/login' => 'user_token#create'
      post '/users/profile' => "users#update_profile"
      post '/add_question' => "questions#add_questions"
      post '/add_questions_file' => "questions#add_questions_file"
      get '/questions' => "questions#get_questions"
      get '/users/profile' => "users#profile"
      post '/new_message' => "messages#new_message"
      get '/messages' => "messages#index"
      get '/chats' => "chats#index"
      post '/users/sign_up' => "users#sign_up"
      post '/friends/add_friend' => "friends#add_friend"
      post '/friends/accept_friend' => "friends#accept_friend"
      get '/friends' => "friends#index"
      post '/friends/unfollow' => "friends#unfollow"
      post '/friends/play_request' => 'friends#play_request'
      post '/friends/reject_request' => 'friends#reject_request'
      get '/users/search' => 'users#search'
      get '/currency_packs' => 'currency_packs#index'
      post '/currency_packs/purchase' => 'currency_packs#buy_pack'
      resources :questions
    end
  end
  devise_for :users
  # resources :users
  post '/images/upload' => 'images#upload'
  # resources :category_answers
  # resources :category_questions
  # resources :answer_questions
  # resources :table_games
  # resources :images
  # resources :answer_texts
  # resources :qtypes
  # resources :categories
  # resources :answers
  # resources :questions
  root to: 'pages#add_question'
  # post '/add_question' => "questions#add_questions"
  # get '/questions' => "questions#get_questions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
