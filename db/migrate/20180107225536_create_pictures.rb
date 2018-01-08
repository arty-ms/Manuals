class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.integer :post_id, index: true
      t.timestamps
    end
    add_foreign_key :pictures, :posts
  end
end
