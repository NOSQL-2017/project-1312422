class AddStatusToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :status, :integer
  end
end
