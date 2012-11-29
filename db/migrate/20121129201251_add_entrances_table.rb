class AddEntrancesTable < ActiveRecord::Migration
  def change
  	create_table :entrances do |t|
  		t.string :name
  		t.float :lat
  		t.float :long
  		t.string :line
  		t.timestamps
  	end
  end
end
