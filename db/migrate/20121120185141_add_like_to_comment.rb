class AddLikeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :like, :integer
    add_column :comments, :nolike, :integer
  end
end
