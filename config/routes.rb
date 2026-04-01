Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get  "/about",   to: "pages#about",   as: :about
  get  "/careers", to: "pages#careers", as: :careers
  get  "/contact", to: "pages#contact", as: :contact
  post "/contact", to: "pages#contact_submit"
  get  "/faq",     to: "pages#faq",     as: :faq

  resources :products, only: [ :index, :show ]
  resources :categories, only: [ :show ], param: :slug
  resource  :cart, only: [ :show ]
  post   "/cart/items/:product_id", to: "cart_items#create",  as: :add_to_cart
  delete "/cart/items/:product_id", to: "cart_items#destroy", as: :remove_from_cart

  post "/checkout",         to: "checkouts#create",  as: :checkout
  get  "/checkout/success", to: "checkouts#success", as: :checkout_success
  get  "/checkout/cancel",  to: "checkouts#cancel",  as: :checkout_cancel
end
