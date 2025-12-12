class Page < ApplicationRecord
  has_many :page_sections, -> { order(:position) }, dependent: :destroy
  has_many_attached :images        # optional page-level images (hero etc.)
  accepts_nested_attributes_for :page_sections, allow_destroy: true

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
