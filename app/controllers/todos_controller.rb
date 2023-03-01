class TodosController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

      def index
        todos = Todo.all
        p todos
        render :json => todos
      end

      def show
        # p current_user
        # todos  =current_user.todos
        # p todos
        # render :json => todos
        todos = Todo.where(user_id: params[:id])
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
