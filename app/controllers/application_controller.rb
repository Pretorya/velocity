class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :cart_count

  def cart_count
    session[:cart]&.values&.sum || 0
  end
end
