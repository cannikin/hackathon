class CreateWallets < ActiveRecord::Migration
  def self.up
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wallets
  end
end
