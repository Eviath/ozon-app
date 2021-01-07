class Api::V1::Service::TilesController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @tiles = Service::Tile.all
    render json: @tiles
  end

  def update
    @tile = Service::Tile.find(params[:id])
    if @tile.update(tile_params)
      render json: Service::Tile.all
    else
      render json: @tile.errors, status: :unprocessable_entity
  end
end

  private

  def tile_params
    params.permit(:title, :desc, :picture)
  end
end