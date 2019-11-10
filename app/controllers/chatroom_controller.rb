class ChatroomController < ApplicationController
  def index
    @messages = Message.last(20)
    @message = Message.new
    @user = current_user ? current_user.email : 'Guest'
  end
end
