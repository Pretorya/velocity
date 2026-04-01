class CartsController < ApplicationController
  def show
    cart = session[:cart] || {}
    product_ids = cart.keys.map(&:to_i)
    products_by_id = Product.includes(:category).where(id: product_ids).index_by { |p| p.id.to_s }
    @items = cart.filter_map do |product_id, qty|
      product = products_by_id[product_id]
      { product: product, quantity: qty } if product
    end
    @total = @items.sum { |item| item[:product].price * item[:quantity] }
  end
end
