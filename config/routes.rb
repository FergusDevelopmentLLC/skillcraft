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

  get '/login', :to => 'people#login'

  get '/logout', :to => 'people#logout'

  get '/post_login', :method => "get", :to => 'people#post_login'

  get '/signup', :method => "get", :to => 'people#new'

  get '/course_people/:course_id/:student_id/destroy', :to => 'course_people#destroy', as: 'course_person'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
