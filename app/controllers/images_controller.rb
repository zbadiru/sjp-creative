class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    def index
        @images = Image.all
        render json: @images
    end

    def show
        render json: @image
    end

    def new
    end

    def create
        @image = Image.create(image_params)
        if @image.valid?
            render json: @image, status: :created, location: @image
        else
            render json: @image.errors, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        @image.update(image_params)
        render json: @image
    end

    def destroy
        @image = image.destroy
        render json: @image
    end

    private 

    def set_image
        @image = Image.find(params[:id])
    end

    def image_params
        params.require(:image).permit(:image_url, :photoshoot_id)
    end
end
