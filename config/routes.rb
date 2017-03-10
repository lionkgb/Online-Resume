Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/pages' => 'pages#index'
  get '/pages/new' => 'pages#new'
  post '/pages' => 'pages#create'
  get '/pages/:id' => 'pages#show'
  get '/pages/:id/edit' => 'pages#edit'
  patch '/pages/:id' => 'pages#update'
  delete '/pages/:id' => 'pages#destroy'
end
