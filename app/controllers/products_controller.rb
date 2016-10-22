class ProductsController < ApplicationController
    before_filter :authorize

  def new
    @product = Product.new
    @for_sale = Product.where(owner_id: nil).where(poster_id: current_user.id)
    @sold  = Product.where(poster_id: current_user.id).where('owner_id IS NOT NULL')
    @purchases = Product.where(owner_id: current_user.id)
    # render plain: @for_sale.count

  end

  def create
    @product = Product.new(product_params)
    @product.poster_id = current_user.id 
    if @product.save
      flash[:alert] = "#{@product.name} created."
      redirect_to '/dashboard'


    else
      redirect_to '/dashboard'

    end


    # render plain: User.find_by_id(@product.owner_id).first_name
  end

  def show

  end

  def buy

  end
  def purchase
    @product = Product.find_by_id(params[:product_id])
    @product.owner_id = current_user.id
    @product.save
    redirect_to '/dashboard'
  end

  def index
    @products = Product.where(owner_id: nil).where("poster_id IS NOT #{current_user.id}")
    # render plain: @products.first.name
  end

  def destroy
    @product = Product.find(params[:product_id])
    @product.destroy
    redirect_to '/dashboard'

    # render plain: @product.name
  end

  private
    def product_params
      params.require(:product).permit(:name, :amount)
    end
end
