Shouldwego::Application.routes.draw do

  root :to => 'home#index'
  get '/home' => 'home#home'
  post '/search' => 'mountain#search'
  get '/gimme_ids', to: 'home#get_all_locations'
  get '/mountain/:id' => 'mountain#index'
end
