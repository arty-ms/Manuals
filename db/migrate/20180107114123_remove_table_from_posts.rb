class RemoveTableFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :uid, :string
  end
end
