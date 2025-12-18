module Api
  module V1
    class TestimonialsController < ApplicationController
      def index
        testimonials = Testimonial.where(approved: true)
        render json: testimonials
      end
    end
  end
end
