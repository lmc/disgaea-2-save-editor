class CreateSaveStorages < ActiveRecord::Migration
  def self.up
    create_table :save_storages do |t|
      t.string :session_id
      t.string :save_file_file_name

      t.timestamps
    end
  end

  def self.down
    drop_table :save_storages
  end
end
