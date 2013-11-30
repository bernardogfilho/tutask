class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.references :project, index: true
      t.integer :owner_id, index: true, class_name: "User"

      t.timestamps
    end
  end
end
