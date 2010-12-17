class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.integer :business_id
      t.integer :user_id

      t.timestamps
    end
    
    Owner.create :business_id => 1, :user_id => 2
  end

  def self.down
    drop_table :owners
  end
end
