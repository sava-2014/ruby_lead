class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy,:edit]

  def create
    @micropost = current_user.products.build(product_params)
    if @micropost.save
      flash[:success] = "Продукт создан"
      redirect_to root_url
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
