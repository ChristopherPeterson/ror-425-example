class Foods < ActiveRecord::Migration
  def self.up
    rename_column :foods, :increment, :portion_increment
  end

  def self.down
    rename_column :foods, :portion_increment, :increment
  end
end
