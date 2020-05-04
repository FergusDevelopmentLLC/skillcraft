Rails.application.routes.draw do
  
  #get "/choose_course", to: '/people#new'

  resources :courses
  resources :people
  resources :teachers
  resources :students
  
  resources :announcements
  resources :assignments
  resources :responses
  
  root 'courses#index'

  # get '/choose_course', :method => "get", :to => 'courses#choose_course'

  get '/login', :to => 'students#login'

  get '/logout', :to => 'students#logout'

  get '/post_login', :method => "get", :to => 'students#post_login'

  get '/signup', :method => "get", :to => 'students#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
