require 'api_constraints'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      post '/add_question' => "questions#add_questions"
      get '/questions' => "questions#get_questions"
      resources :questions
    end
  end
  devise_for :users
  resources :users
  post '/images/upload' => 'images#upload'
  resources :category_answers
  resources :category_questions
  resources :answer_questions
  resources :table_games
  resources :images
  resources :answer_texts
  resources :qtypes
  resources :categories
  resources :answers
  # resources :questions
  root to: 'pages#add_question'
  post '/add_question' => "questions#add_questions"
  get '/questions' => "questions#get_questions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
