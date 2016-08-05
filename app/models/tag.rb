class Tag < ActiveRecord::Base
  has_and_belongs_to_many :todo_items, class_name: "TodoItem"

  def to_s
  	"Tag Name: #{tag_name}"
  end
end
