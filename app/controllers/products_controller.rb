class ProductsController < ApplicationController
  
  def index    
   
      @products = Product.where(:is_paid => true)
   
  end

  def new
    @product = current_user.products.build
  end
  
  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to index_path
    else
      render :new
    end

  end

  def show 
    
    @product= Product.find(params[:id])
  end
  
  
  private
  def product_params   
    params.require(:product).permit(:product_name, :product_description, :product_price, :user_id)
  end

end
