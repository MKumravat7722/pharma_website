module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.includes(:category).where(published: true)
    
        if params[:q].present?
          products = products.where("name ILIKE ?", "%#{params[:q]}%")
        end
    
        render json: products, include: [:category, :documents]
      end

      def show
        product = Product.find_by!(slug: params[:slug])

        render json: product
      end
    end
  end
end