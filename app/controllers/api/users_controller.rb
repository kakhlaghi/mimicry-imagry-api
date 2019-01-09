require 'auth'
require 'pry'
class Api::UsersController < ApplicationController

   # def create
    #    user = User.new(params)
     #   if user.save
      #      #render json: response, status: 200
       #     render json: {token: Auth.createToken(user)}
        #else
         #   render json: {message: user.errors.full_messages}, status: 400

#        end

    #end

    def signup
        user = User.new(user_params)
        if user.save
            #render json: response, status: 200
            render json: {token: Auth.create_token({name: user.name, id: user.id, email: user.email})}

        else
            render json: {message: user.errors.full_messages}, status: 400

        end
    end



    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
