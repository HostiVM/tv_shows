class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :show_id
      t.datetime :release
    end
  end
end
