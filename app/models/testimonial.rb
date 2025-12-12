class Testimonial < ApplicationRecord
  has_one_attached :photo
  validates :quote, presence: true
  validates :author, presence: true
end
