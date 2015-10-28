class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true
      t.string :title, null: false
      t.text :body, null: false
      t.integer :views

      t.timestamps null: false
    end
  end
end
