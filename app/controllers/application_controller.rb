class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :check_session_expiry

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    end

    def check_session_expiry
      if current_user && session[:last_activity] && session[:last_activity] < 30.minutes.ago
        sign_out current_user
        reset_session
        flash[:notice] = 'Your session has expired due to inactivity.'
        redirect_to root_path
      else
        session[:last_activity] = Time.current
      end
    end

    def update_activity
      session[:last_activity] = Time.current
      head :ok
    end    
end
