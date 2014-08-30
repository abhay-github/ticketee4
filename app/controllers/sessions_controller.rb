class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
  	usr = User.find_by(email: params[:session][:email])
  	if usr.authenticate(params[:session][:password])
      sign_in usr
  		# route to user profile
      # redirect_to usr, notice: "Welcome, #{usr.name}!"
  		redirect_to usr, notice: "Welcome, #{@current_user.name}!"
  	else
  		render 'new', alert: "Username / Password do not match."
  	end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

    def sign_out
      cookies.delete(:ticketee_token)
      @current_user = nil
    end
end
