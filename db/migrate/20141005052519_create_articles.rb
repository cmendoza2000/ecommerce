class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :category
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
