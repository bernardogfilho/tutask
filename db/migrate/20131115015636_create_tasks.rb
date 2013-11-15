class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :project, index: true
      t.boolean :completed

      t.timestamps
    end
  end
end
