class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy,:edit]

  def show
    @product = Product.find(params[:id])
    @user = current_user
    @target = @product.targets.build

    @targets = @product.targets.paginate(page: params[:page])
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = "Проект создан"
      redirect_to root_path
    else
      flash[:success] = "Проверьте форму"
      @feed_items = []
      render 'static_pages/home'
    end
  end


  def destroy
  end

  def edit

  end


    private

    def product_params
      params.require(:product).permit(:project, :name, :description, :price)
    end

end
