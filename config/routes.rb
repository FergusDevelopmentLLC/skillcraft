Rails.application.routes.draw do
  resources :answers
  resources :interactions
  resources :topics
  resources :people
  resources :teachers
  resources :students
  resources :course_teachers
  resources :course_students
  resources :courses
  resources :classrooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
