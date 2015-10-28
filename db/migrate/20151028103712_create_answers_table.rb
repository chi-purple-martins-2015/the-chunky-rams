class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
