class PagesController < ApplicationController
  def home
  end
  def contact_form
  end
  def send_email
    require_login
    FormMailer.with(subject: params[:subject], body: params[:body]).form_email(current_user).deliver_now
    flash[:success] = 'Email sent'
    redirect_to root_path
  end
end
