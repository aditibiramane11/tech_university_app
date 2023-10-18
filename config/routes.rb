Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'courses#index'
  get 'courses/new' ,to: 'courses#new'
  get 'about', to: 'pages#about'  
  resources :students
  get 'login' , to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
end
