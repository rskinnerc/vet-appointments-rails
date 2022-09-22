# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post 'appointments/create'
  get 'users/:user_id/appointments', to: 'appointments#index'
  delete 'appointments/delete'
  post 'doctors/create'
  get 'doctors/index'
  delete 'doctors/delete'
  post 'users/create'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
