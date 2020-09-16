class PhotoshootController < ApplicationController
    before_action :set_photoshoot, only: [:show, :edit, :update, :destroy]

    def index
        @photoshoots = Photoshoot.all
        render json: @photoshoots
    end

    def show
        render json: @photoshoot
    end

    def new
    end

    def create
        @photoshoot = Photoshoot.new(photoshoot_params)

        if @photoshoot.save
        render json: @photoshoot, status: :created, location: @photoshoot
        else
        render json: @photoshoot.errors, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        @photoshoot.update(photoshoot_params)
        render json: @photoshoot
    end

    def destroy
        @photoshoot = photoshoot.destroy
        render json: @photoshoot
    end

    private 

    def set_photoshoot
        @photoshoot = Photoshoot.find(params[:id])
    end

    def photoshoot_params
        params.require(:photoshoot).permit(:name, :portfolio_id)
    end
end
