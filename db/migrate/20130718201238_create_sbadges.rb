class CreateSbadges < ActiveRecord::Migration
  def change
    create_table :sbadges do |t|
      t.int :namecounter
      t.int :websitecounter
      t.int :videocounter
      t.int :logocounter
      t.int :visitcounter
      t.int :feedbackcounter
      t.int :moneycounter
      t.int :textpitchcounter
      t.references :startup

      t.timestamps
    end
    add_index :sbadges, :startup_id
  end
end
