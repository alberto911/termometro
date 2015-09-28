class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def require_session
    @user = Usuario.find session[:user_id] if session[:user_id]
    if @user.nil?
      redirect_to login_url, alert: "Por favor inicia sesión"  
    end
  end

end
