class CreateFriend < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :status
    end
  end
end
