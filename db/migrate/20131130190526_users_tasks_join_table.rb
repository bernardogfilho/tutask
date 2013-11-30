class UsersTasksJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :tasks, table_name: :users_tasks_join_table do |t|
      t.index :user_id
      t.index :task_id
    end
  end
end
