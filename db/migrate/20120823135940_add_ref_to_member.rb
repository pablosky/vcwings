class AddRefToMember < ActiveRecord::Migration
  def change

  add_column :members, :profile_id, :integer
  add_index :members, :profile_id 
  end
end
