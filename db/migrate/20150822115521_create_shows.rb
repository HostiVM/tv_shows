class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows, primary_key: 'tv_rage_id' do |t|
      t.string :name
      t.string :status
    end
  end
end
