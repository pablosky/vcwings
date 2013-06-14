class AddMoneyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :money, :integer
  end
end
