class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :mtype
      t.string :job
      t.references :startup
      t.references :user

      t.timestamps
    end
    add_index :members, :startup_id
    add_index :members, :user_id
  end
end
