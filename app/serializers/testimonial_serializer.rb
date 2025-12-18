class TestimonialSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :author, :designation, :quote, :photo

  def photo
    return nil unless object.photo.attached?

    rails_blob_url(object.photo, only_path: false)
  end
end
