class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        auth = request.env["omniauth.auth"]
        if current_user   
          @user = UserProvider.find_for_oauth(auth,current_user.id)
        else
          @user = UserProvider.find_for_oauth(auth,nil)
        end
        if (!@user.nil? && @user.persisted?)     
        sign_in_and_redirect @user, :event => :authentication
        else
        session["devise.facebook_uid"] = auth
        redirect_to new_user_registration_url
        flash["notice"] = "You should registrate, or Login and connect your acount to Social"
        end       
    end

    def vkontakte
        auth = request.env["omniauth.auth"]
        if current_user   
          @user = UserProvider.find_for_oauth(auth,current_user.id)
        else
          @user = UserProvider.find_for_oauth(auth,nil)
        end
        if (!@user.nil? && @user.persisted?)     
        sign_in_and_redirect @user, :event => :authentication
        else
        session["devise.vkontakte_uid"] = auth
        redirect_to new_user_registration_url
        flash["notice"] = "You should registrate, or Login and connect your acount to Social"
        end       
    end

    def twitter
        auth = request.env["omniauth.auth"]
        if current_user   
          @user = UserProvider.find_for_oauth(auth,current_user.id)
        else
          @user = UserProvider.find_for_oauth(auth,nil)
        end
        if (!@user.nil? && @user.persisted?)     
        sign_in_and_redirect @user, :event => :authentication
        else
        session["devise.twitter_uid"] = auth
        redirect_to new_user_registration_url
        flash["notice"] = "You should registrate, or Login and connect your acount to Social"
        end       
    end

end
