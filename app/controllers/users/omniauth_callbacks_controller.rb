class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
        employer = false
        if session[:employer] == 1
            employer = true
        end

        @user = User.from_omniauth(request.env["omniauth.auth"], employer)
        
        if @user.valid?
            sign_in_and_redirect @user
        else
            render 'devise/sessions/new'
        end
    end

    def landing
        # Form for user type selection
        render 'devise/registrations/landing'
    end

    def add_to_session
        # Pass user type selection to session hash
        if params[:employer] == "1"
            session[:employer] = 1
        else
            session[:employer] = 0
        end
        redirect_to staging_path
    end

    def staging
        # Link to FB sign-in with user type in session 
        render 'devise/registrations/facebook'
    end

end