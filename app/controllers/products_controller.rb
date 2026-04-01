class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
    if params[:q].present?
      q = "%#{params[:q]}%"
      @products = @products.where("name LIKE ? OR badge LIKE ?", q, q)
    end
    @query = params[:q]
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end
end
