class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook        
        @user = User.from_omniauth(request.env["omniauth.auth"])
        
        if @user.valid?
            sign_in_and_redirect @user
        else
            render 'devise/sessions/new'
        end
    end

    def landing
        render 'devise/registrations/landing'
    end
end