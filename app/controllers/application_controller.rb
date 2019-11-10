class ApplicationController < ActionController::Base
  def require_login
    unless current_user
      flash[:danger] = 'You must be logged in'
      redirect_to root_path
    end
  end
end
