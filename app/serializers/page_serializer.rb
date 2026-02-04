class PageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :title,
             :slug,
             :meta_title,
             :meta_description,
             :settings,
             :images,
             :sections

  def images
    return [] unless object.images.attached?

    object.images.map { |img| rails_blob_url(img) }
  end

  def sections
    object.page_sections.order(:position).map do |s|
      {
        id: s.id,
        type: s.section_type,
        position: s.position,
        content: s.content || {},
        images: s.images.attached? ? s.images.map { |img| rails_blob_url(img) } : []
      }
    end
  end
end
