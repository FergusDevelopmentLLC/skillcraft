Rails.application.routes.draw do
  resources :teachers
  resources :students
  resources :course_teachers
  resources :course_students
  resources :classrooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
