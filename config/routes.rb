Rails.application.routes.draw do
  devise_for :admins
  root 'home#index'

  resources 'posts' do 
  end

  resources 'tags' do
  end

  resources 'about' do
  end
end
