class MessagesController < ApplicationController
  def create
    return if params[:message][:content] == ''
    message = current_user.messages.build(content: params[:message][:content])
    if message.save
      ActionCable.server.broadcast 'chatroom_channel', content: render_message(message)
    else
      flash[:danger] = 'Message not sent.'
      redirect_to root_path
    end
  end

  private
  
  def render_message(message)
    render partial: 'message', locals: {message: message}
  end

end
