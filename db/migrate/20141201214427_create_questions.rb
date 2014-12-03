class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :content

      t.timestamps
    end
  end
end
