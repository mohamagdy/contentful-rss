class AddNextSyncUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :next_sync_url, :string
  end
end
