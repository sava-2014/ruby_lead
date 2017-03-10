class TargetsController < ApplicationController

  def new
    @target = Target.new
  end

  def create
    @product = Product.find(cookies[:product_id])
    cookies[:product_id] = ''
    @target = @product.targets.build(target_params)
    if @target.save
      redirect_to product_path(@product)
    else
      redirect_to root_path
    end
  end

  def show
    @target = Target.find(params[:id])
  end

  private
  def target_params
    params.require(:target).permit(:target_name)
  end
end
