Rails.application.routes.draw do
  
  resources :courses
  resources :users
  resources :teachers, controller: 'users'
  resources :students, controller: 'users'
  
  resources :announcements
  resources :assignments
  resources :responses
  
  root 'courses#index'

  get '/login', :to => 'users#login'

  get '/logout', :to => 'users#logout'

  get '/post_login', :to => 'users#post_login'

  get '/signup', :to => 'users#new'

  get '/users/:id/randomize_avatar', :to => 'users#randomize_avatar'

  get '/course_users/:course_id/:student_id/destroy', :to => 'course_users#destroy', as: 'course_user'
  
end
