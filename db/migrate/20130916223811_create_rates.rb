class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :user
      t.references :startup
      t.integer :name
      t.integer :website
      t.integer :video
      t.integer :logo
      t.integer :text
      t.integer :idea

      t.timestamps
    end
    add_index :rates, :user_id
    add_index :rates, :startup_id
  end
end
