Rails.application.routes.draw do
  get '/products', to:'products#index' #Cuando alguien haga una peticion de tipo GET en /products, le mandaremos al controlador llamado products, concretamente al metodo index
end
