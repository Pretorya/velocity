class CheckoutsController < ApplicationController
  def create
    cart = session[:cart] || {}
    return redirect_to(cart_path) if cart.empty?

    product_ids = cart.keys.map(&:to_i)
    products_by_id = Product.where(id: product_ids).index_by { |p| p.id.to_s }

    line_items = cart.filter_map do |product_id, qty|
      product = products_by_id[product_id]
      next unless product

      {
        quantity: qty,
        price_data: {
          currency: "eur",
          unit_amount: (product.price * 100).to_i,
          product_data: { name: product.name }
        }
      }
    end

    session_obj = Stripe::Checkout::Session.create(
      mode: "payment",
      line_items: line_items,
      success_url: checkout_success_url(session_id: "{CHECKOUT_SESSION_ID}"),
      cancel_url:  checkout_cancel_url
    )

    redirect_to session_obj.url, allow_other_host: true
  rescue Stripe::StripeError => e
    redirect_to cart_path, alert: "Erreur Stripe : #{e.message}"
  end

  def success
    session[:cart] = {}
  end

  def cancel
  end
end
