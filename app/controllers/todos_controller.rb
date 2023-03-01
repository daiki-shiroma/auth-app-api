class TodosController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

      def index
        todos = Todo.all.order(created_at: :asc)
        p todos
        render :json => todos
      end

      def show
        todos = Todo.where(user_id: params[:id]).order(created_at: :asc)
        render :json => todos
      end
    
      def create
        Todo.create(todo_params)
        head :created
      end
    
      def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        head :ok
      end
    
      def destroy_all
        Todo.destroy_all
        head :no_content
      end
    
      def destroy_doneTask
        todo=Todo.where(complete: true)
        todo.destroy_all
        head :ok
      end
    
    
      def update
        todo =Todo.find(params[:id])
        todo.update(todo_params)
        head :ok
      end
    
      private
    
    def todo_params
      params.require(:todo).permit(:name, :complete, :user_id)
    end
end