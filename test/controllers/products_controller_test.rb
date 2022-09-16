require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path  # products_path = '/products'

        assert_response :success # Estamos esperando que la respuesta sea satisfactoria, que no haya ningun error en nuestro codigo
        assert_select '.product', 2 # Esperamos que haya 2 productos en la base de datos (Creamos la base de datos de ejemplo en products.yml)
    end

    test 'render a detailed product page' do
        get product_path(products(:ps4)) # product_path = '/products/id'

        assert_response :success
        assert_select '.title', 'PS4 Fat'
        assert_select '.description', 'PS4 en buen estado'
        assert_select '.price', '150'
    end

    test 'render a new product form' do
        get new_product_path

        assert_response :success
        assert_select 'form'
    end

end