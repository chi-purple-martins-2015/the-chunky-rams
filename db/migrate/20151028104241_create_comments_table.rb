class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentable_type, null: false
      t.integer :commentable_type_id, null: false

      t.timestamps null: false
    end
  end
end
