class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.date :due_date
      t.string :task_title
      t.string :description
      t.references :todo_list, index: true

      t.timestamps null: false
    end
  end
end
