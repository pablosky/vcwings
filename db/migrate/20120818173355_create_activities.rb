class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :startup
      t.string :name
      t.text :description
      t.date :day

      t.timestamps
    end
    add_index :activities, :startup_id
  end
end
