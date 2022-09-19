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

    test 'allows to create a new product' do

        post products_path, params: {
            product: {
                title:'Nintendo 64',
                description:'Le falta los cables',
                price: 45
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Tu producto se ha creado correctamente'

    end

    test 'does not allows to create a new product with empty fields' do

        post products_path, params: {
            product: {
                title:'',
                description:'Le falta los cables',
                price: 45
            }
        }

        assert_response :unprocessable_entity

    end

    test 'render an edit product form' do
        get edit_product_path(products(:ps4))

        assert_response :success
        assert_select 'form'
    end

    test 'allows to update a product' do

        patch product_path(products(:ps4)), params: {
            product: {
                price: 165
            }
        }

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Tu producto se ha actualizado correctamente'

    end

    test 'does not allow to update a product with an invalid field' do

        patch product_path(products(:ps4)), params: {
            product: {
                price: nil
            }
        }

        assert_response :unprocessable_entity

    end

    test 'can delete products' do

        assert_difference('Product.count', -1) do
            delete product_path(products(:ps4))
        end

        assert_redirected_to products_path
        assert_equal flash[:notice], 'Tu producto se ha eliminado correctamente'

    end

end