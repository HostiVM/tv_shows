class AddEndedToShows < ActiveRecord::Migration
  def change
    add_column :shows, :ended, :boolean
  end
end
