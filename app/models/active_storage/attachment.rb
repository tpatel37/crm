# app/models/active_storage/attachment.rb
class ActiveStorage::Attachment < ApplicationRecord
    # Allowlisting attributes that can be searched
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end
  end
  