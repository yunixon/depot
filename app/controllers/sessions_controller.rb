class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, notice: "Welcome back #{user.name}"
    else
      respond_to do |format|
        @error = "Invalid user/password combination"
        format.html { render :action => :new}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged out"
  end

end
