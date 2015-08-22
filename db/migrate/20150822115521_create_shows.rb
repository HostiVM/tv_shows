class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :czech_name
      t.integer :status
      t.integer :tv_rage_id
    end
  end
end
