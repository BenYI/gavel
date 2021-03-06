class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_user

  helper_method :current_user
  def current_user
  	#for caching - global var
  	return @current_user if @current_user

  	user_id = session[:current_user_id]

  	if user_id
  		@current_user =  User.find(user_id)
  		return @current_user
  	else
  		return nil
  	end
  end


  def require_user
  	if current_user
  		return true
  	else
  		redirect_to new_session_url
  	end
  end

  def require_current_equals_resource
    if current_user && current_user.id == params[:id]
      return true
    else
      redirect_to new_session_url
    end
  end

  def require_admin
    if current_user && current_user.role == "admin"
      return true
    else
      redirect_to new_session_url
    end
  end

end
