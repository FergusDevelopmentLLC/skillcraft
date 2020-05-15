Rails.application.routes.draw do
  
  resources :courses
  resources :users
  resources :teachers, controller: 'users'
  resources :students, controller: 'users'
  
  resources :announcements
  resources :assignments
  resources :responses
  
  root 'layouts#index'

  get '/welcome', to: 'layouts#welcome'

  get '/signin', to: 'users#signin'

  get '/signout', to: 'users#signout'

  get '/post_signin', to: 'users#post_signin'

  get '/signup', to:'users#new'

  get '/users/:id/randomize_avatar', to: 'users#randomize_avatar'

  get '/course_users/:course_id/:student_id/destroy', to: 'course_users#destroy', as: 'course_user'

  get '/announcements/:course_id/new', to: 'announcements#new', as: 'announcement_course_new'

  get '/assignments/:course_id/new', to: 'assignments#new', as: 'assignments_course_new'

  get '/responses/:interaction_id/new', to: 'responses#new', as: 'responses_interaction_new'

  # auths
  get '/auth/twitter/callback', to: 'sessions_twitter#create'
  get '/signout_twitter', to: 'sessions_twitter#destroy'
  get '/signin_twitter_choose', to: 'users#choose', as: 'signin_twitter_choose'
  
end
