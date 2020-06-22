Rails.application.routes.draw do
  
  root 'layouts#index'

  resources :courses
  resources :users
  resources :teachers, controller: 'users'
  resources :students, controller: 'users'

  resources :interactions #TODO remove
  resources :announcements, controller: 'interactions'
  resources :assignments, controller: 'interactions'
  resources :responses #TODO remove
  resources :questions, controller: 'responses'
  resources :completed_assignments, controller: 'responses'

  resources :comments, only: [:create, :update, :destroy]

  get '/welcome', to: 'layouts#welcome'

  get '/signin', to: 'users#signin'

  get '/signout', to: 'users#signout'

  get '/post_signin', to: 'users#post_signin'

  get '/signup', to:'users#new'

  #randomize user avatar
  get '/users/:id/randomize_avatar', to: 'users#randomize_avatar'

  # new announcement/assignment for a course
  get '/announcements/:course_id/new', to: 'interactions#new', as: 'announcements_course_new'
  get '/assignments/:course_id/new', to: 'interactions#new', as: 'assignments_course_new'
  
  # new question/completed_assignment for an interaction (assignment/announcement)
  get '/questions/:announcement_id/new', to: 'responses#new', as: 'questions_announcement_new'
  get '/completed_assignments/:assignment_id/new', to: 'responses#new', as: 'completed_assignments_assignment_new'

  # withdraw a student/teacher from a course
  get '/courses_users/:course_id/:student_id/destroy', to: 'courses_users#destroy', as: 'courses_user'
  
  # various course listings
  get '/courses/free', to: 'courses#free', as: 'courses_free'
  get '/courses/featured', to: 'courses#featured', as: 'courses_featured'
  get '/courses/featured/free', to: 'courses#featured_free', as: 'courses_featured_free'

  # courses for student/teacher
  get '/teachers/:teacher_id/courses', to: 'courses#courses_for_teacher', as: 'courses_for_teacher'
  get '/students/:student_id/courses', to: 'courses#courses_for_student', as: 'courses_for_student'

  # students/teachers for course
  get '/courses/:course_id/students', to: 'users#students_for_course', as: 'students_for_course'
  get '/courses/:course_id/teachers', to: 'users#teachers_for_course', as: 'teachers_for_course'

  # auths
  get '/auth/twitter/callback', to: 'sessions_twitter#create'
  get '/signout_twitter', to: 'sessions_twitter#destroy'
  get '/signin_twitter_choose', to: 'users#choose', as: 'signin_twitter_choose'
  
end
