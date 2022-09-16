# frozen_string_literal: true

Rails.application.routes.draw do
  post 'appointments/create'
  get 'appointments/index'
  delete 'appointments/delete'
  post 'doctors/create'
  get 'doctors/index'
  delete 'doctors/delete'
  post 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
