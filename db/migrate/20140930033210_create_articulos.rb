class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :name
      t.string :category
      t.string :string
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
