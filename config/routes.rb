Rails.application.routes.draw do
  resources :category_answers
  resources :category_questions
  resources :answer_questions
  resources :table_games
  resources :images
  resources :answer_texts
  resources :qtypes
  resources :categories
  resources :answers
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
