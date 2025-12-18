class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :name,
             :slug,
             :brand,
             :short_description,
             :description,
             :composition,
             :indications,
             :dosage,
             :published,
             :images,
             :documents,
             :category

  # Simple: return full URLs just like AboutSerializer
  def images
    return [] unless object.images.attached?

    object.images.map do |img|
      rails_blob_url(img, only_path: false)
    end
  end

  def documents
    object.product_documents.map do |doc|
      {
        id: doc.id,
        title: doc.title,
        document_type: doc.document_type,
        url: doc.file.attached? ? rails_blob_url(doc.file, only_path: false) : nil
      }
    end
  end

  def category
    return unless object.category

    {
      id: object.category.id,
      name: object.category.name,
      slug: object.category.slug
    }
  end
end
