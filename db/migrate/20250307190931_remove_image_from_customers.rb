class RemoveImageFromCustomers < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :image, :string
  end
end
