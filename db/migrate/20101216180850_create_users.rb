class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :phone

      t.timestamps
    end
    
    User.create :first_name => 'Rob', :last_name => 'Cameron', :email => 'cannikinn@gmail.com', :password => 'bosco', :phone => '7606725123'
    User.create :first_name => 'Rob', :last_name => 'Cameron', :email => 'rob.cameron@active.com', :password => 'bosco'
    
  end

  def self.down
    drop_table :users
  end
end
