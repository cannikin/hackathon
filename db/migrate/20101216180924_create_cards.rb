class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :uid
      
      t.timestamps
    end
    
    Card.create :uid => '0f0302a39f'
  end

  def self.down
    drop_table :cards
  end
end
