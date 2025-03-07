class Customer < ApplicationRecord
    # Validations (if any)
    validates :email, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :phone_number, presence: true
  
    # Associations (if any)
    # belongs_to :something
    # has_many :other_model
  
    # Add ransackable_attributes method to allow specific search fields
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "email", "full_name", "id", "image", "notes", "phone_number", "updated_at"]
    end
  
    # Scopes or class methods (if any)
    scope :active, -> { where(active: true) }
  
    # Instance methods (if any)
    def full_name_with_email
      "#{full_name} (#{email})"
    end
  
    # Any other code you need for the model
  end
  