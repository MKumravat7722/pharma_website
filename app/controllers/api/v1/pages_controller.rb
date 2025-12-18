module Api
  module V1
    class PagesController < ApplicationController
      def index
        pages = Page.where(published: true).order(:id)
        render json: pages
      end

      def show
        page = Page.includes(page_sections: [images_attachments: :blob],
                             images_attachments: :blob)
                   .find_by!(slug: params[:slug])

        render json: page
      end
    end
  end
end
