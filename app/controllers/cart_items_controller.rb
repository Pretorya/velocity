class CartItemsController < ApplicationController
  def create
    session[:cart] ||= {}
    id = params[:product_id].to_s
    session[:cart][id] = (session[:cart][id] || 0) + 1
    redirect_back fallback_location: cart_path, notice: "Produit ajouté au panier."
  end

  def destroy
    session[:cart]&.delete(params[:product_id].to_s)
    redirect_to cart_path
  end
end
