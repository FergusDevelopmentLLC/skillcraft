Rails.application.routes.draw do
  
  #get "/choose_course", to: '/people#new'

  resources :courses
  resources :people
  #resources :teachers
  #resources :students
  
  resources :announcements
  resources :assignments
  resources :responses
  
  #root 'layouts#index' # shortcut for the above
  root 'layouts#choice'

  # get '/choose_course', to: '/people#new'
  # resources :people, controller: 'people#index'
  get '/choose_course', :method => "get", :to => 'courses#index'

  get '/login', :method => "get", :to => 'people#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
