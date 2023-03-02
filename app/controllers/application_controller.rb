class ApplicationController < ActionController::Base
    include ActionController::Cookies # 追加
    skip_before_action :verify_authenticity_token

    helper_method :login!, :current_user

    def login!
        session[:user_id] = @user.id
        cookies.signed[:session_id] = session.id #追加
    end

    def current_user
　　　　　session_id = cookies.signed[:session_id] #追加
　　　　　session = Session.find_by(id: session_id) #追加
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end