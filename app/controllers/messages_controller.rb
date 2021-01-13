class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
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
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  def message_params
    params.require(:message_tag).permit(:title, :whom, :message, :open_plan, :name, :video, images: []).merge(user_id: current_user.id)
  end
end
