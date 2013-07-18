class CreateSbadges < ActiveRecord::Migration
  def change
    create_table :sbadges do |t|
      t.integer :namecounter
      t.integer :websitecounter
      t.integer :videocounter
      t.integer :logocounter
      t.integer :visitcounter
      t.integer :feedbackcounter
      t.integer :moneycounter
      t.integer :textpitchcounter
      t.references :startup

      t.timestamps
    end
    add_index :sbadges, :startup_id
  end
end
