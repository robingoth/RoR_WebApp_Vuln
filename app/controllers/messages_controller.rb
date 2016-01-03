class MessagesController < ApplicationController
	before_action :require_user, only: [:index, :show]
  
  def index
    	@message = Message.new
		  @messages = Message.all
      @current_user ||= User.find(session[:user_id])
	end

	def new
		@message = Message.new
	end

	def create
    	@message = Message.new(message_params)
    	if @message.save
      	redirect_to '/messages'
    else
     	render 'new'
    end
  end

  def delete
    @messages = Message.all
    @messages.each do |message|
      Message.destroy(message)
    end

    flash[:notice] = "You deleted all messages"
    redirect_to '/messages'
  end

  def admin
  end
  
  private 
  	def message_params
    	params.require(:message).permit(:content)
  	end
end
