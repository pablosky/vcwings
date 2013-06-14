class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :startup

      t.timestamps
    end
    add_index :comments, :startup_id
  end
end
