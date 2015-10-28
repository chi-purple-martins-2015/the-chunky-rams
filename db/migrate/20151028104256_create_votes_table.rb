class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :votable_type, null: false
      t.integer :votable_type_id, null: false

      t.timestamps null: false
  end
end
