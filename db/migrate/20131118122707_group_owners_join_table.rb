class GroupOwnersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :projects, table_name: :groups_owners_join_table do |t|
      t.index :user_id
      t.index :project_id
    end
  end
end
