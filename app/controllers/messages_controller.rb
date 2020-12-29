class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:)
end
