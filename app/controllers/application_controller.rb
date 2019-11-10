class ApplicationController < ActionController::Base
  before_action :get_ip

  def require_login
    unless current_user
      flash[:danger] = 'You must be logged in'
      redirect_to root_path
    end
  end

  def get_ip
    Ip.create(data: request.remote_ip.to_s)
  end
end
