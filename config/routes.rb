Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'greeting#index'
  get '/gyms', to: 'gyms#index'
  get '/gyms/:id', to: 'gyms#show'
  get '/machines', to: 'machines#index'
  get '/machines/:id', to: 'machines#show'
end
