require 'Faraday'

class Api::ImagesController < ApplicationController
   

    def index

        Faraday.get 'https://api.imgur.com/3/gallery/t/gifs' do |req|
            req.params
        end   
       # token = request.env["HTTP_AUTHORIZATION"]
       #if token && Auth.decode_token(token) 
        #    @user = User.find_by(id: params[:user_id])
         #   render json: Image.order('id DESC')
       #else
        #    render json: { error: {message: "Need Valid Token"}}, status: 500
       #end

    end

    def create
        image = Image.new(image_params)
        if image.save
            render json: image
        else
            render json: {message: image.errors.full_messages}, status: 400
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
