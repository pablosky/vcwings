class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|

      t.string :name
      t.string :founder #el mail del founder como id
      t.string :member1 #mail del member
      t.string :member2
      t.string :member3
      t.string :video #url del video
      t.string :jobf
      t.string :job1
      t.string :job2
      t.string :job3
      t.text :description
      t.integer :vmoney
      t.string :website
      t.timestamps
    end
  end
 
end
