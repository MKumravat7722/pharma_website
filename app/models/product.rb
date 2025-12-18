class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  has_many :product_documents, dependent: :destroy
  has_many :cart_items

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
  validates :category, presence: true
end
