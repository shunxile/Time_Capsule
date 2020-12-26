class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @messages = Message.all
  end
end
