class ProductsController < ApplicationController
    def index
        @products = Product.all() # Nos devuelve todos los productos, y lo almacenamos en una variable global o de instancia
    end

    def show
        @product = Product.find(params[:id]) # Con params[:id] obtenemos el parametro que enviemos en la url
    end

end