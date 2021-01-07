class Api::V1::Information::TilesController < ApplicationController
    include TokenAuthenticatable
    skip_before_action :authenticate_user, only: [:index, :show]
  
    def index
     @tiles = Information::Tile.all.order(:created_at)
      render json: @tiles
    end

    def update
        @tile = Information::Tile.find(params[:id])
        if @tile.update(tile_params)
          render json: Information::Tile.all
        else
          render json: @tile.errors, status: :unprocessable_entity
        end
    end

    private
  
    def tile_params
      params.permit(:desc, :picture)
    end
  end