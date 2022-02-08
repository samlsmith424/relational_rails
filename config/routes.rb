Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get '/', to: 'welcome#index'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealership#new'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to:'cars#show'
  get '/dealerships/:dealership_id/cars', to: 'dealership_cars#index'

  get '/', to: 'greeting#index'
  get '/gyms', to: 'gyms#index'
  get '/gyms/new', to: 'gyms#new'
  get '/gyms/:id', to: 'gyms#show'
  get '/machines', to: 'machines#index'
  get '/machines/:id', to: 'machines#show'
  get '/gyms/:gym_id/machines', to: 'gym_machines#index'
  post '/gyms', to: 'gyms#create'
  get '/gyms/:gym_id/edit', to: 'gyms#edit'
  patch '/gyms/:gym_id', to: 'gyms#update'
  get '/gyms/:gym_id/machines/new', to: 'gym_machines#new'
  post '/gyms/:gym_id/machines', to: 'gym_machines#create'
  get '/machines/:id/edit', to: 'machines#edit'
  patch '/machines/:id', to: 'machines#update'
end
