class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredient
      t.integer :user_id
      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
