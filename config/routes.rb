Rails.application.routes.draw do
  resources 'posts' do 
  end
  resources 'tags' do
  end
  root 'posts#index'
end
