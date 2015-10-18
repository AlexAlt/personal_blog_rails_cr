Rails.application.routes.draw do
  root 'layouts#index'

  resources 'posts' do 
  end

  resources 'tags' do
  end

  resources 'about' do
  end
end
