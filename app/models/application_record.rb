class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map(&:name).map(&:to_s)
  end
end
