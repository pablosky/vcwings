class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :activity
      t.string :name

      t.timestamps
    end
    add_index :albums, :activity_id
  end
end
