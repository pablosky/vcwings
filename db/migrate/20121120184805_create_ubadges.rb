class CreateUbadges < ActiveRecord::Migration
  def change
    create_table :ubadges do |t|
      t.integer :earlyadapt
      t.integer :advangel
      t.integer :ffather
      t.integer :vetinvestor
      t.integer :feedmaster
      t.integer :voiceofwisdom
      t.integer :knowit
      t.integer :moneywise
      t.references :user

      t.timestamps
    end
    add_index :ubadges, :user_id
  end
end
