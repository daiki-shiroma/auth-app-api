class TodosController < ApplicationController

  def index
     todos = Todo.all.order(created_at: :asc)
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
    
  def update
    begin 
     todo =Todo.find(params[:id])
     todo.update(todo_params)
     head :ok
    rescue ActiveRecord::RecordNotFound
     not_found
    end
  end

  def destroy
    begin
     todo = Todo.find(params[:id])
     todo.destroy
     head :ok
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
    
  def destroy_all
     Todo.destroy_all
     head :no_content
  end
    
  def destroy_done
     todos= Todo.where(complete: true)
     todos.destroy_all
     head :ok
  end
    
  private   
  def todo_params
    params.require(:todo).permit(:name, :complete, :user_id)
  end
end
