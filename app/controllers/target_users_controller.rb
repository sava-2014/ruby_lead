class TargetUsersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy,:edit]


  def index
    #@target_users = TargetUser.all
  end

  def show
    #@user = User.find(params[:id])
    #@products = @user.products.paginate(page: params[:page])
    @product = params[:session][:n_product]
  #  @product = @products.paginate.
    @target_users = @product.target_users.paginate(page: params[:page])
  #  @target_user = User.find(params[:id])
  #  @products = @user.products.paginate(page: params[:page])
  end


  def create
    @target_user = current_user.table_target_users.build(target_user_params)
    if @product.save
      flash[:success] = "Продукт создан"
      redirect_to root_url
    else
      flash[:error] = "Проверьте форму"
      #@feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def edit

  end


  private

  def target_user_params
    params.require(:product).permit(:project, :name, :description, :price)
  end

end
