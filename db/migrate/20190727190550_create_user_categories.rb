class CreateUserCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_categories do |t|
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end