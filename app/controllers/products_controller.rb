class ProductsController < ApplicationController
    def index
        @products = Product.all.with_attached_photo.order(created_at: :desc) # Nos devuelve todos los productos, y lo almacenamos en una variable global o de instancia
    end

    def show
        product # Con params[:id] obtenemos el parametro que enviemos en la url
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)

        if @product.save

            redirect_to products_path, notice: t('.created')

        else
        
            render :new, status: :unprocessable_entity

       end

    end

    def edit
        product
    end

    def update

        if product.update(product_params)

            redirect_to products_path, notice: t('.updated')

        else

            render :edit, status: :unprocessable_entity
        
        end

    end

    def destroy
        product.destroy
        redirect_to products_path, notice: t('.destroyed'), status: :see_other
    end

    private 

    def product_params
        params.require(:product).permit(:title, :description, :price, :photo, :category_id)
    end

    def product
        @product = Product.find(params[:id])
    end

end