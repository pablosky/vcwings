class AddWalletToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :wallet, :integer
  end
end
