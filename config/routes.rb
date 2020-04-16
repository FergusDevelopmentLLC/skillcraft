Rails.application.routes.draw do
  resources :teachers
  resources :students
  resources :people
  resources :classrooms
  resources :courses
  resources :interactions
  resources :responses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
