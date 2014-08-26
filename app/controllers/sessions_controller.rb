class SessionsController < ApplicationController
  def new
  end

  def create
  	usr = User.find_by(email: params[:session][:email])
  	if usr.authenticate(params[:session][:password])
  		# set a cookie on browser
  		# session['ticketee'] = 
  		# route to user profile
  		redirect_to usr, notice: "Welcome, #{usr.name}!"
  	else
  		render 'new', alert: "Username / Password do not match."
  	end
  end

  def destroy
  end
end
