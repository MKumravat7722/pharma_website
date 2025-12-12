class ProductDocument < ApplicationRecord
  belongs_to :product
  has_one_attached :file

  validates :title, presence: true
  validates :document_type, presence: true
end
