class Customer < ApplicationRecord
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :phone_number, presence: true

  # Ransack settings for ActiveAdmin filters
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "full_name", "id", "notes", "phone_number", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
