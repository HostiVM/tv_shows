class ChangeStatusToStringInShows < ActiveRecord::Migration
  def up
    change_column :shows, :status, :string
  end

  def down
    change_column :shows, :status, :integer
  end
end
