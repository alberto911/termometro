class LoginController < ApplicationController
	def form
	end

	def login
		@user = Usuario.authenticate(params[:username], params[:password])
    if @user.nil?
      redirect_to root_url, alert: 'Usuario/contraseña no válido'
    else
      session[:user_id] = @user.id
     	redirect_to root_url, notice: 'Login exitoso'
    end
	end

	def logout
    reset_session
    redirect_to root_url, notice: "Has cerrado sesión"      
  end

end
