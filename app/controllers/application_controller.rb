class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :login!, :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request
  rescue_from StandardError, with: :internal_server_error

  def not_found
    render json: { error: "ユーザーが見つかりませんでした" }, status: :not_found
  end

  def bad_request
    render json: { error: "不正なリクエストです" }, status: :bad_request
  end

  def internal_server_error
    render json: { error: "エラーが発生しました" }, status: :internal_server_error
  end

  def login!
    session[:user_id] = @user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
