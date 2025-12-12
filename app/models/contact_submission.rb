class ContactSubmission < ApplicationRecord
  # submission_type: contact, sample_request, distributor
  validates :email, presence: true
  validates :message, presence: true
end
