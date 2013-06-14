class AddFieldToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :category, :string
    add_column :startups, :country, :string
    add_column :startups, :stage, :string
    add_column :startups, :revenue, :string
    add_column :startups, :semail, :string
  end
end
