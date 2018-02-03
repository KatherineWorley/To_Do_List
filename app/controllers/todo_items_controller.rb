class TodoItemsController < ApplicationController
	before_action :set_todo_list


	def create
		@todo_list = TodoList.find(params[:todo_list_id])
		@todo_item = @todo_list.todo_items.create(params[:todo_item].permit(:content))
	end

	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])
		if @todo_item.destroy
			flash[:success] = "Todo List item was deleted"
		else
			flash[:error] = "todo List item could not be deleted"
		end

		redirect_to @todo_list
	end


	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_items_params
		params[:todo_item].permit(:content)
	end

end
