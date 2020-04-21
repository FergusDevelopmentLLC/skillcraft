Rails.application.routes.draw do
  resources :classrooms
  resources :courses
  resources :topics

  resources :teachers
  resources :students
  
  resources :announcements
  resources :questions
  resources :tests
  resources :quizzes

  resources :responses

  root 'classrooms#index' # shortcut for the above

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
