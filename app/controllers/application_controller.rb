class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if not_logged_in?
    # unless logged_in?
      redirect_to new_session_path
    end
  end

  def require_logged_in?
    if logged_in?
      redirect_to tasks_path
    end
  end

  
end
