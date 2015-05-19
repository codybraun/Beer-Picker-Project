Rails.application.routes.draw do
  root 'beers#index'
#  get '/beers/:beer_id/ratings(.:format)'=> 'ratings#index', as: 'ratings'
#  post '/beers/:beer_id/ratings(.:format)'=>'ratings#create' 
#  get '/beers/:beer_id/ratings/new(.:format)'=>'ratings#new', as: 'new_rating'
#  get     '/beers/:beer_id/ratings/:id/edit(.:format)'=>'ratings#edit', as: 'edit_rating'
#  get '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#show'
#  patch  '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#update'
#  put    '/beers/:beer_id/ratings/:id(.:format)'=> 'ratings#update'
#  delete '/beers/:beer_id/ratings/:id(.:format)'=>'ratings#destroy'
#  get   '/beers(.:format)'=>'beers#index', as: 'beers'
#  post   '/beers(.:format)'=>'beers#create'
#  get '/beers/new(.:format)'=>'beers#new', as: 'new_beer'
#  get '/beers/:id/edit(.:format)'=>'beers#edit' , as: 'edit_beer'
#  get '/beers/:id(.:format)'=>'beers#show'
#  patch  '/beers/:id(.:format)'=>'beers#update'
#  put    '/beers/:id(.:format)'=>'beers#update'
#  delete '/beers/:id(.:format)'=>'beers#destroy' 
  

   resources :beers do
     resources :ratings
   end
  
   resources :users
   resources :breweries
   resources :sessions, only: [:new, :create]
   delete '/sessions/', to: 'sessions#destroy'  

end
