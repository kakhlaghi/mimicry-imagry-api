class Api::ImagesController < ApplicationController
    before_action :authenticate_user
    before_action :set_image, only: [:show, :update, :destroy]

    def index
        if current_user
            @user = User.find_by(id: params[:user_id])
            render json: Image.order('id DESC')
        end   
    end

    def create
        image = Image.new(image_params)
        if image.save
            render json: image
        else
            render json: {message: image.errors}, status: 400
        end
    end

    def show
        render json: Image.find_by(id: params[:id])
    end

    def update
        image = Image.find(params[:id])
        image.update_attributes(image_params)
        render json: image
    end



    private

    def image_params
        params.require(:image).permit(:imgur_id, :user_id)
    end

end
