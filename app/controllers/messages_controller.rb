class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:title, :whom, :message, :open_plan, :image, :video).merge(user_id: current_user.id)
  end
end
