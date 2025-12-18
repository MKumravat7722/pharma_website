module Api
  module V1
    class ContactSubmissionsController < ApplicationController
      def create
        submission = ContactSubmission.new(contact_submission_params)
        if submission.save
          # optionally: ContactMailer.notify_admin(submission).deliver_later
          render json: { success: true }, status: :created
        else
          render json: { errors: submission.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def contact_submission_params
        params.require(:contact_submission).permit(:name, :email, :phone, :message, :submission_type, meta: {})
      end
    end
  end
end
