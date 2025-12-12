class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable, :timeoutable


  enum :role, {
    viewer: 'viewer',
    editor: 'editor',
    admin: 'admin'
  }, prefix: true
  

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  def display_name
    name.presence || email
  end
end
