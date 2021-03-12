class LocationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @locations = Location.all.order(:city)
    end
end
