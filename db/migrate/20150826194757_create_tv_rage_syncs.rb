class CreateTvRageSyncs < ActiveRecord::Migration
  def change
    create_table :tv_rage_syncs do |t|
      t.string :data_type
      t.integer :summary_hash
      t.datetime :created_at
    end

    create_first_sync_records unless reverting?
  end


  private

  def create_first_sync_records
    shows  = Sofa::TVRage::Show.list
    events = Sofa::TVRage::Schedule.full(:us)

    TvRageSync.create data_type: 'show', summary_hash: shows.hash
    TvRageSync.create data_type: 'event', summary_hash: events.hash
  end
end
