class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.string :title
      t.text :content
      t.references :project, index: true
      t.references :task, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
