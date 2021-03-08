class Users::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        render 'devise/users/show'
    end
end