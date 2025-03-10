class Customer < ApplicationRecord
  has_one_attached :image  # Add ActiveStorage image attachment

  # Define attributes that can be searched
  def self.ransackable_attributes(auth_object = nil)
    ["id", "full_name", "phone_number", "email", "notes", "created_at", "updated_at"]
  end

  # Define associations that can be searched
  def self.ransackable_associations(auth_object = nil)
    ["orders", "invoices", "addresses"]  # Replace with actual association names if needed
  end
end