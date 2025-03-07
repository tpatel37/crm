class AddImageToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :image, :string
  end
end
