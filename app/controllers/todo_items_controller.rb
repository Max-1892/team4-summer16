class TodoItemsController < ApplicationController
	before_action :set_todo_list, only: [:edit, :update, :new, :show, :create, :destroy]

	def show
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

 	def edit
		@todo_item = @todo_list.todo_items.find(params[:id])
  	end

	def new
		@todo_item = @todo_list.todo_items.new
  	end

	def create
		@todo_item = @todo_list.todo_items.new(todo_list_params)
		if @todo_item.save
			redirect_to @todo_list, notice: "Item #{@todo_item.task_title} successfully added!"
		else
			redirect_to @todo_list, alert: "Couldn't add item!"
		end
	end

  def update
  	@todo_item = @todo_list.todo_items.find(params[:id])
    respond_to do |format|
      if @todo_item.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: "Todo item #{@todo_item.task_title} was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])
		@todo_item.destroy
		redirect_to @todo_list, notice: "Item deleted!"
	end

	private
		def set_todo_list
			@todo_list = current_user.todo_lists.find(params[:todo_list_id])
		end

		def todo_list_params
			params.require(:todo_item).permit(:task_title, :description, :due_date, :done)
		end
end