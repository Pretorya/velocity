class Category < ApplicationRecord
  has_many :products

  validates :name, :slug, presence: true

  def to_param
    slug
  end
end
