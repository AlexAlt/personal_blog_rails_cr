Rails.application.routes.draw do

  root 'home#index'

  resources 'users' do
  end
  
  resources 'posts' do 
  end

  resources 'tags' do
  end

  resources :sessions, :only => [:new, :create, :destroy]

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :about, :only => [:index]
  resources :admin, :only => [:index]
end
