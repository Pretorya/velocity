class CategoriesController < ApplicationController
  def show
    @category = Category.find_by!(slug: params[:slug])
    @products = @category.products
  end
end
