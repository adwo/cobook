class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :gender, :limit => 1
      
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
