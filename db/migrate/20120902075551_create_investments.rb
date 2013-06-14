class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :user
      t.references :startup
      t.integer :vcmoney

      t.timestamps
    end
    add_index :investments, :user_id
    add_index :investments, :startup_id
  end
end
