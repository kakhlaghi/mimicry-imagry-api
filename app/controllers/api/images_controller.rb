class Api::ImagesController < ApplicationController

    def index
        render json: Image.all
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


    private

    def set_image

    end


    def images_params
        params.require(:image).permit(:imgur_id, :user_id)
    end

end
