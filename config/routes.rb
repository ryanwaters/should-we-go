Shouldwego::Application.routes.draw do

  root :to => 'home#index'
  get '/home' => 'home#home'
  get '/how_to_use' => 'home#how_to_use'
  get '/about' => 'home#about'
  match '/search' => 'mountain#search'
  get '/gimme_ids', to: 'home#get_all_locations'
  get '/mountain/:id' => 'mountain#index'
end
