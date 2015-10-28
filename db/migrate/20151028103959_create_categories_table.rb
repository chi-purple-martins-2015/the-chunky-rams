class CreateCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :tag
      t.belongs_to :question

      t.timestamps null: false
    end
  end
end
