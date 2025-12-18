class PageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :title,
             :slug,
             :meta_title,
             :meta_description,
             :settings,
             :published,
             :images,
             :sections

  def images
    return [] unless object.images.attached?

    object.images.map { |img| rails_blob_url(img, only_path: false) }
  end

  def sections
    object.page_sections.map do |s|
      {
        id: s.id,
        section_type: s.section_type,
        position: s.position,
        content: s.content || {},
        images: s.images.map { |img| rails_blob_url(img, only_path: false) }
      }
    end
  end
end
