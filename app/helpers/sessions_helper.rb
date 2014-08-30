module SessionsHelper
	# def sign_in(usr)
 #      token = SecureRandom.urlsafe_base64
 #      cookies[:ticketee_token] = token
 #      hashed_token = Digest::SHA1.hexdigest(token)
 #      usr.update(remember_token: hashed_token)
 #      @current_user = usr
 #    end

 #    def signed_in?
 #    	if current_user.nil?
 #    		return false;
 #    	else
 #    		return true
 #    	end
 #    end

 #    def current_user
 #    	@current_user ||= User.find_by(remember_token: hashed(cookies[:ticketee_token]))
 #    end

 #    def hashed(token)
 #    	Digest::SHA1.hexdigest(token.to_s)
 #    end
end
