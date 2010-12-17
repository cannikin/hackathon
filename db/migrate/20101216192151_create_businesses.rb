class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name

      t.timestamps
    end
    
    Business.create :name => 'Running Shack'
  end

  def self.down
    drop_table :businesses
  end
end
