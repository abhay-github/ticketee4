class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
  	usr = User.find_by(email: params[:session][:email])
  	if usr.authenticate(params[:session][:password])
      session[:user_id] = usr.id
  		redirect_to root_path, notice: "Welcome, #{usr.name}!"
  	else
  		render 'new', alert: "Username / Password do not match."
  	end
  end

  def destroy
    # sign_out
    # redirect_to root_path
  end

  private

    
end
