class UsersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { error: "ユーザーが見つかりませんでした" }, status: :not_found
  end

  def index
    users = User.all
    render :json => users
  end

  def show
    begin
      user = User.find(params[:id])
      render :json => user
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end
 
  def update_email
    duplicated_user = User.find_by(email: user_params[:email])
    if duplicated_user.nil?
      begin
        user = User.find(params[:id])
        user.update(user_params)
        render :json => user
      rescue ActiveRecord::RecordNotFound
        not_found
      end
    else
        render json: { status: 409, error: '既に登録されています' }, status: 409
    end
  end
  
  def update_password
    begin
      user = User.find(params[:id])
      user.update(user_params)
      render :json => user
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy
      head :ok
    rescue ActiveRecord::RecordNotFound
      not_found
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
