module Api
  module V1
    class PagesController < ApplicationController
      include Rails.application.routes.url_helpers

      def index
        pages = Page.where(published: true)
        render json: pages
      end

      def show
        page = Page.includes(page_sections: [images_attachments: :blob],
                             images_attachments: :blob)
                   .find_by!(slug: params[:slug], published: true)

        render json: page, serializer: PageSerializer
      end
    end
  end
end
