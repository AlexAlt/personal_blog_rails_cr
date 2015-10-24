Rails.application.routes.draw do

  root 'home#index'

  resources 'posts' do 
  end

  resources 'tags' do
  end

  resources :about, :only => [:index]
  resources :admin, :only => [:index]
end
