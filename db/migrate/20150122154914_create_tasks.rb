class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :tasks, [:user_id, :created_at]
  end
end
