Rails.application.routes.draw do
  
  resources :courses
  resources :people
  resources :teachers, controller: 'people'
  resources :students, controller: 'people'
  
  resources :announcements
  resources :assignments
  resources :responses
  
  root 'courses#index'

  get '/login', :to => 'people#login'

  get '/logout', :to => 'people#logout'

  get '/post_login', :to => 'people#post_login'

  get '/signup', :to => 'people#new'

  get '/people/:id/randomize_avatar', :to => 'people#randomize_avatar'

  get '/course_people/:course_id/:student_id/destroy', :to => 'course_people#destroy', as: 'course_person'
  
end
