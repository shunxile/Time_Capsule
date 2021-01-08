class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @messages = Message.all
  end

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

  def edit
    @message = Message.find(params[:id])
    if current_user.id != @message.user.id
      redirect_to root_path
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to message_path(@message.id)
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if current_user.id == @message.user.id
      @message.destroy
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :whom, :message, :open_plan, :image, :video).merge(user_id: current_user.id)
  end
end
