Rails.application.routes.draw do
  
  resources :courses
  resources :teachers
  resources :students
  
  resources :announcements
  resources :assignments
  
  resources :responses
  root 'layouts#index' # shortcut for the above

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
