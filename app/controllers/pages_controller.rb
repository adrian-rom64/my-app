class PagesController < ApplicationController
  before_action :require_login, except: :home

  def home
  end
  def contact_form
  end
  def send_email
    data = {
      subject: params[:subject],
      body: params[:body],
      receiver: params[:receiver]
    }
    FormMailer.form_email(data).deliver_now
    flash[:success] = 'Email sent'
    redirect_to root_path
  end
end
