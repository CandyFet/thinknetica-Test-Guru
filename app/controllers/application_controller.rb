class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    helper_method :current_user,
                  :logged_in?

    private

    def authenticate_user!
        unless current_user
            set_last_page
            redirect_to login_path
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        current_user.present?
    end

    def set_last_page
        session[:last_page] = request.referer
    end
    
end
