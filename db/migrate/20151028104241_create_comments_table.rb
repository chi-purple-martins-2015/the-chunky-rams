class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.references :commentable, polymorphic: true, index: true

      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
