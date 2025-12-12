class PageSection < ApplicationRecord
  belongs_to :page
  has_many_attached :images

  validates :section_type, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  # helper to safely read JSON content
  def content_hash
    content || {}
  end
end
