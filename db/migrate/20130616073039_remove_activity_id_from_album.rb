class RemoveActivityIdFromAlbum < ActiveRecord::Migration
  def up
  
  remove_column :albums, :activities


  end

  def down
  end
end
