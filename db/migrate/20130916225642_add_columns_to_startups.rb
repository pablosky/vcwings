class AddColumnsToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :postext, :integer
    add_column :startups, :posidea, :integer
    add_column :startups, :posname, :integer
    add_column :startups, :poswebsite, :integer
    add_column :startups, :posvideo, :integer
    add_column :startups, :poslogo, :integer
    add_column :startups, :commentcount, :integer
    add_column :startups, :visitcount, :integer
    add_column :startups, :negtext, :integer
    add_column :startups, :negidea, :integer
    add_column :startups, :negname, :integer
    add_column :startups, :negwebsite, :integer
    add_column :startups, :negvideo, :integer
    add_column :startups, :neglogo, :integer
  end
end
