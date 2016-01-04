class SessionsController < ApplicationController
	skip_before_filter :require_login

  def new 
	end

	def create 
    @user = User.where("email = '#{params[:session][:email]}' AND password = '#{params[:session][:password]}'").first
    #@user = User.find_by_email(params[:session][:email])
    if @user == nil
      flash[:error] = "Wrong username or password"
      render 'new'
      return
    end
    
    if @user
      session[:user_id] = @user.id
      redirect_to '/messages'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
