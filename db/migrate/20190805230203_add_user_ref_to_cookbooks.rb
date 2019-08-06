class AddUserRefToCookbooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :cookbooks, :user_id
    add_reference :cookbooks, :user, foreign_key: true
  end
end
