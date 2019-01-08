class Api::UsersController < ApplicationController

    def create
        user = User.new(params)
        if user.save
            #render json: response, status: 200
            render json: {token: Auth.createToken(user)}
        else
            render json: {message: user.errors.full_messages}, status: 400

        end

    end

    def signup
        user = User.new(params)
        if user.save
            render json: response, status: 200
        else
            render json: {message: user.errors.full_messages}, status: 400

        end
    end



    private

    def user_params
        params_require(:user).permit(:name, :email, :password)
    end

end
