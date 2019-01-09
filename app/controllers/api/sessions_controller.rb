require 'pry'
require 'auth'

class Api::SessionsController < ApplicationController

   # def create
    #    user = User.find_by(name: login_params[:name])
   # end

    def login
        user = User.find_by(name: login_params[:name])
        if user && user.authenticate(params[:password])
            render json: {token: Auth.create_token({name: user.name, email: user.email, id: user.id}) }
        else
            render json: { errors: user.errors.full_messages }, status: 500
        end

    end

    private

    def login_params
        params.require(:user).permit(:name, :email, :password)
    end



end
