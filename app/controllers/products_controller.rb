class ProductsController < ApplicationController
    def index
        @products = Product.all() # Nos devuelve todos los productos, y lo almacenamos en una variable global o de instancia
    end
end