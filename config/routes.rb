Rails.application.routes.draw do
  resources :teachers
  resources :students
  resources :people
  resources :classrooms
  resources :courses
  resources :interactions
  resources :responses
  resources :topics
  resources :announcements
  resources :questions
  resources :tests
  resources :quizzes

  root 'classrooms#index' # shortcut for the above

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
