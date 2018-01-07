class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.string :uid
      t.timestamps
    end
  end
end
