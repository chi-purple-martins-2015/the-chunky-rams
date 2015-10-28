class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
