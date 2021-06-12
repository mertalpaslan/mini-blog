class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def google_oauth2
		provider_data = request.env['omniauth.auth']
		user = User.find_by_email(provider_data.info.email)
		if user.present?
			sign_in_and_redirect user
		else
			begin 
				user = User.new(email: provider_data.info.email, first_name: provider_data.info.first_name, last_name: provider_data.info.last_name, password: Devise.friendly_token[0, 20])
				user.save
				sign_in user
				redirect_to root_path, notice: 'Signed in successfully..'
			rescue
				failure
			end
		end
	end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to root_path
  end
end
  