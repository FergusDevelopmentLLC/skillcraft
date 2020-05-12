Rails.application.routes.draw do
  
  resources :courses
  resources :users
  resources :teachers, controller: 'users'
  resources :students, controller: 'users'
  
  resources :announcements
  resources :assignments
  resources :responses
  
  root 'courses#index'

  get '/signin', :to => 'users#signin'

  get '/signout', :to => 'users#signout'

  get '/post_signin', :to => 'users#post_signin'

  get '/signup', :to => 'users#new'

  get '/users/:id/randomize_avatar', :to => 'users#randomize_avatar'

  get '/course_users/:course_id/:student_id/destroy', :to => 'course_users#destroy', as: 'course_user'

  # auths
  get '/auth/twitter/callback' => 'sessions_twitter#create'
  get '/signout_twitter' => 'sessions_twitter#destroy'
  get '/signin_twitter' => 'sessions_twitter#new', as: 'signin_twitter'
  
end
