class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, class_name: "TodoList"
  has_and_belongs_to_many :tags, class_name: "Tag"

  default_scope { order due_date: :asc }

  def to_s
    "Task title: '#{task_title}', Description: '#{description}', Due date: '#{due_date}'"
  end
end
