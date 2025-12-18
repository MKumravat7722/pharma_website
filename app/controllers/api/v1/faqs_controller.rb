module Api
  module V1
    class FaqsController < ApplicationController
      def index
        faqs = Faq.all
        render json: faqs
      end
    end
  end
end
