class WelcomeController < ApplicationController
    def index
        flash[:notice] = "Hello!!!!"
        flash[:alert] = "This is alert!!!"
        flash[:warning] = "This is warning!!!"
    end
end
