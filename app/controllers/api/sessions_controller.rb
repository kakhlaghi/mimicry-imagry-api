require 'pry'
class Api::SessionsController < ApplicationController

    def create
        user = User.find_by(name: login_params[:name])
    end

    def login
        user = User.find_by(name: login_params[:name])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: { errors: user.errors.full_messages }, status: 500
        end

    end


end
