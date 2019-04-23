class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource) #ログイン後のパス
    	# user_path(current_user.id)

    if resource.id == 1
       users_path
    else
       user_path(current_user.id)
  	end
  end

  	def after_sign_out_path_for(resource) #ログアウト後のパス
    	root_path
  	end

  	protected
  	def configure_permitted_parameters
   		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  	end

end

