class PagesController < ApplicationController
  def home
    @categories = Category.all
    @products = Product.includes(:category).all
  end

  def about
  end

  def careers
  end

  def contact
  end

  def contact_submit
    name    = params[:name].to_s.strip
    email   = params[:email].to_s.strip
    message = params[:message].to_s.strip

    if name.blank? || email.blank? || message.blank?
      flash.now[:alert] = "Tous les champs sont obligatoires."
      render :contact, status: :unprocessable_entity
    else
      # TODO: brancher un mailer ici
      redirect_to contact_path, notice: "Message envoyé ! Nous te répondrons sous 48h."
    end
  end

  def faq
  end
end
