class AddIsAuthorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_author, :boolean, default: false
  end
end
