class AddColumnToUserProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :user_providers, :username, :string
  end
end
