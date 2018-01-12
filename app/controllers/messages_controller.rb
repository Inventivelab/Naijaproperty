class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def index
    if current_user == @chat.sender || current_user == @chat.recipent
      @other = current_user == @chat.sender ? @chat.recipent : @chat.sender
      @messages = @chat.messages.order("created_at DESC")
    else
      redirect_to chats_path, alert: "You don't have permission to view this."
    end
  end

  def create
    @message = @chat.messages.new(message_params)
    @messages = @chat.messages.order("created_at DESC")

    if @message.save
      ActionCable.server.broadcast "chat_#{@chat.id}", message: render_message(@message)
      redirect_to chat_messages_path(@chat)
    end
  end

  private

    def render_message(message)
      self.render(partial: 'messages/message', locals: {message: message})
    end

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    def message_params
      params.require(:message).permit(:context, :user_id)
    end
end
