class UsersController < ApplicationController

    def user_index
        users = User.all
        render :json => users
    end

    def user_get
        users = User.find(params[:id])
        render :json => users
    end

    def user_todos
        userId = User.find_by(id: params[:user_id])
        # user_id = current_user.id
        todos=Todo.where(userId)
        render :json => todos
    end

   
end