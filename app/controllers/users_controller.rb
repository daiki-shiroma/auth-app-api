class UsersController < ApplicationController

    def index
        users = User.all
        render :json => users
    end

    def show
        users = User.find(params[:id])
        render :json => users
    end

    def user_todos
        # userId = User.find_by(id: params[:user_id])
        userId = User.find_by(id: current_user.id)
        # userId = User.find(session[:user_id])
        # userId = current_user.id
        todos=Todo.where(id:userId)
        render :json => todos
    end

    def update_email
        # if User.find_by(email: user_params.email) !=null
        # p user_params
        # if User.find_by(email: user_new_email) ==nil
        duplicated_email=User.find_by(email: user_params[:email])
        p duplicated_email
        if duplicated_email==nil
            user = User.find(params[:id])
            user.update(user_params)
            render :json => user
        else
            render json: { status: 401, errors: ['認証に失敗しました。', '既に登録されています'] }
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        head :ok
    end

    private
    
    def user_params
      params.require(:user).permit(:email, :password_digest)
    end

end