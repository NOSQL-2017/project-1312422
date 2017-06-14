class AddCoverFilenameToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :cover_filename, :string
  end
end
