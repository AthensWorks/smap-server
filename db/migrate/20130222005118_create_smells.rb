class CreateSmells < ActiveRecord::Migration
  def change
    create_table :smells do |t|
      t.float :lat
      t.float :long
      t.string :name
      t.integer :up_votes, :default => 0
      t.integer :down_votes, :default => 0

      t.timestamps
    end
  end
end
