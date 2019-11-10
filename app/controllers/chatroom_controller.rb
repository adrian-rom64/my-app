class ChatroomController < ApplicationController
  def index
    @messages = Message.last(20)
    @message = Message.new
  end
end
