class AddAvatarToStartup < ActiveRecord::Migration
  def change
    add_column :startups, :avatar, :string
  end
end
