class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :album
      t.string :name
      t.text :description
      t.string :avatar

      t.timestamps
    end
    add_index :photos, :album_id
  end
end
