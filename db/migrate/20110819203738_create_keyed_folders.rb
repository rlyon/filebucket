class CreateKeyedFolders < ActiveRecord::Migration
  def self.up
    create_table :keyed_folders do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :keyed_folders
  end
end
