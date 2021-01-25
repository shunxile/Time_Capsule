class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :search_message, only: [:index, :search]

  def index
    @q = Message.ransack(params[:q])
    @messages = Message.includes(:user).order("created_at DESC")
  end

  def new
    @message = MessageTag.new
  end

  def create
    @message = MessageTag.new(message_params)
    if @message.valid?
      @message.save
      return redirect_to root_path
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

  def search
    set_search
  end

  private
  def message_params
    params.require(:message_tag).permit(:title, :whom, :message, :open_plan, :name, :video, images: []).merge(user_id: current_user.id)
  end

  def update_message_params
    params.require(:message_tag).permit(:title, :whom, :message, :open_plan, :name, :video, images: []).merge(user_id: current_user.id)
  end

  def search_message
    @m = Message.ransack(params[:q])
  end

  def set_search
    @search = Message.ransack(params[:q])
    @search_messages = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
  end
end
