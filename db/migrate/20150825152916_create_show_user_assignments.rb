class CreateShowUserAssignments < ActiveRecord::Migration
  def change
    create_table :show_user_assignments do |t|
      t.integer :show_id
      t.integer :user_id
    end
  end
end
