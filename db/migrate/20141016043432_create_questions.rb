class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
