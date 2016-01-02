class SessionsController < ApplicationController
	def new 
	end

	def create 
    @user = User.find_by_email(params[:session][:email])
    @entered_pwd = params[:session][:password]
    @user_pwd = @user.password
    
    #if @user && @user.authenticate(params[:session][:password])
    if @user && @entered_pwd == @user_pwd
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
