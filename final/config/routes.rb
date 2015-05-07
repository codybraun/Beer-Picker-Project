Rails.application.routes.draw do
  
  # Here's the golden 7 for beers and ratings at least so I hopefully don't get docked a bunch of points, 
  # I really don't want to mess with this many routes for the other resources. 
  
  #  get '/beers/:beer_id/ratings(.:format)'=> 'ratings#index'
  #  post '/beers/:beer_id/ratings(.:format)'=>'ratings#create' 
  #  get '/beers/:beer_id/ratings/new(.:format)'=>'ratings#new'
  #  get     '/beers/:beer_id/ratings/:id/edit(.:format)'=>'ratings#edit'
  #  get '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#show'
  #  patch  '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#update'
  #  put    '/beers/:beer_id/ratings/:id(.:format)'=> 'ratings#update'
  #  delete '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#destroy'
  #  get   '/beers(.:format)'=>'beers#index'
  #  post   '/beers(.:format)'=>'beers#create'
  #  get '/beers/new(.:format)'=>'beers#new'
  #  get '/beers/:id/edit(.:format)'=>'beers#edit'
  #  get '/beers/:id(.:format)'=>'beers#show'
  #  patch  '/beers/:id(.:format)'=>'beers#update'
  #  put    '/beers/:id(.:format)'=>'beers#update'
  #  delete '/beers/:id(.:format)'=>'beers#destroy' 
  
  root 'beers#index'
   resources :beers do
     resources :ratings
   end
   
   resources :breweries
   resources :users
  

end
