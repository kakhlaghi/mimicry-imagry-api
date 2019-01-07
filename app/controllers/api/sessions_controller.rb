require 'pry'
class Api::SessionsController < ApplicationController

    def create
        user = User.find_by(name: login_params[:name])
    end


end
