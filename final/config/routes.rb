Rails.application.routes.draw do
  root 'beers#index'
   #nest reviews- this way, always have a place id to associate with a newly created review
   resources :beers do
     resources :ratings
   end
end
