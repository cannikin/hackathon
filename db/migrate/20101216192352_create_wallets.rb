class CreateWallets < ActiveRecord::Migration
  def self.up
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
    
    Wallet.create :user_id => 1, :card_id => 1
    
  end

  def self.down
    drop_table :wallets
  end
end
