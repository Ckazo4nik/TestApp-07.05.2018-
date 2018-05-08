class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :category_id, :integer
    create_table :categories do |t|
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end
end
