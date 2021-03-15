class ApplicationController < ActionController::Base

    def home
    end

    private
    
    def after_sign_in_path_for(resource)
        root_path
    end
end
