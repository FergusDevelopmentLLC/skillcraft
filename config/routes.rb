Rails.application.routes.draw do
  resources :classrooms
  resources :courses
  resources :topics

  resources :teachers
  resources :students
  resources :people

  resources :announcements
  resources :assignments
  resources :posts
  resources :questions
  resources :tests
  resources :quizzes

  resources :responses

  root 'layouts#index' # shortcut for the above

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
