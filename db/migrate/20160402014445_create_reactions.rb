class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :debat_id
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :reactions, :debat_id
  end
end
