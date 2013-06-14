class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :email
      t.string :country
      t.text :biography
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
