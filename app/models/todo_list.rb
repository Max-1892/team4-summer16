class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, class_name: "TodoItem"

  default_scope { order list_due_date: :asc }

  def list_done?
  	@done_list=[]
    self.todo_items do |item|
    	@done_list << item.done?
    end
    @done_list.any?
  end

  def to_s
    "List name: #{list_name}, Due date: #{list_due_date}"
  end
end
