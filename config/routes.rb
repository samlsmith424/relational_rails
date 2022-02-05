Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get '/', to: 'welcome#index'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to:'cars#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'

  get '/', to: 'greeting#index'
  get '/gyms', to: 'gyms#index'
  get '/gyms/:id', to: 'gyms#show'
  get '/machines', to: 'machines#index'
  get '/machines/:id', to: 'machines#show'
  get '/gyms/:gym_id/machines', to: 'gym_machines#index'
end
