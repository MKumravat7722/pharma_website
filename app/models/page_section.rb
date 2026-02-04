class PageSection < ApplicationRecord
  belongs_to :page
  has_many_attached :images

  validates :section_type, presence: true
end
