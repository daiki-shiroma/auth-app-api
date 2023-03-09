class UsersController < ApplicationController

    def index
        users = User.all
        render :json => users
    end

    def show
        users = User.find(params[:id])
        render :json => users
    end

    def user_Todos
        userId = User.find_by(id: current_user.id)
        todos=Todo.where(id:userId)
        render :json => todos
    end

    def update_Email
        duplicated_Email=User.find_by(email: user_params[:email])
        if duplicated_Email==nil
            user = User.find(params[:id])
            user.update(user_params)
            render :json => user
        else
            render json: { status: 409, errors: ['既に登録されています'] }, status: 409
        end
    end

    def update_Password
        user = User.find(params[:id])
        user.update(user_params)
        render :json => user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        head :ok
    end

    private
    
    def user_params
      params.require(:user).permit(:email, :password)
    end

end