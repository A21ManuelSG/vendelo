Rails.application.routes.draw do
  post '/products', to: 'products#create'
  get '/products/new', to: 'products#new', as: :new_product 
  get '/products', to:'products#index' #Cuando alguien haga una peticion de tipo GET en /products, le mandaremos al controlador llamado products, concretamente al metodo index
  get '/products/:id', to: 'products#show', as: :product
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
end
