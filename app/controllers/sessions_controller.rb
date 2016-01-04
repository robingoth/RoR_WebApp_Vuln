class SessionsController < ApplicationController
	skip_before_filter :require_login

  def new 
	end

	def create 
    @user = User.find_by_email(params[:session][:email])
    if @user != nil  
      @entered_pwd = params[:session][:password]
      @user_pwd = @user.password
    else
      flash[:error] = "Wrong username"
      render 'new'
      return
    end
    
    if @user && @entered_pwd == @user_pwd
      session[:user_id] = @user.id
      redirect_to '/messages'
    else
      flash[:error] = "Wrong password"
      render 'new'
      return
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
