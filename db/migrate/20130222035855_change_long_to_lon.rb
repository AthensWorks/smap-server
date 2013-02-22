class ChangeLongToLon < ActiveRecord::Migration
  def up
    rename_column :smells, :long, :lon
  end

  def down
    rename_column :smells, :lon, :long
  end
end
