class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @product  = current_user.products.build
      @feed_items = current_user.product_feed.paginate(page: params[:page])
    end

  end

  def help
  end

  def about
  end

  def contacts

  end
end
