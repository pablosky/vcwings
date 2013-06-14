class RemoveFieldFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :founder
    remove_column :startups, :member1
    remove_column :startups, :member2
    remove_column :startups, :member3
    remove_column :startups, :job1
    remove_column :startups, :job2
    remove_column :startups, :job3
    remove_column :startups, :jobf
  end

  def down
    add_column :startups, :job3, :string
    add_column :startups, :job2, :string
    add_column :startups, :job1, :string
    add_column :startups, :member3, :string
    add_column :startups, :member2, :string
    add_column :startups, :member1, :string
    add_column :startups, :founder, :string
  end
end
