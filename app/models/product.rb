class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true

  def color_classes
    colors.to_s.split("|")
  end

  def formatted_price
    "#{price.to_i} €"
  end

  def formatted_old_price
    "#{old_price.to_i} €" if old_price?
  end
end
