class Api::UsersController < ApplicationController

    def create
        user = User.new(params)
        if user.save
            render json: respnse, status: 200
        else
            render json: {message: user.errors}, status: 400

        end

    end



    private

    def user_params
        params_require(:user).permit(:name, :email, :password)
    end

end
