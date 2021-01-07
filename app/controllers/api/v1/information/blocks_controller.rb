class Api::V1::Information::BlocksController < ApplicationController
    include TokenAuthenticatable
    skip_before_action :authenticate_user, only: [:index, :show]
  
    def index
     @blocks = Information::Block.all.order(:created_at)
      render json: @blocks
    end

    def update
        @block = Information::Block.find(params[:id])
        if @block.update(block_params)
          render json: Information::Block.all
        else
          render json: @block.errors, status: :unprocessable_entity
        end
    end

    private
  
    def block_params
      params.require(:block).permit(:title, :desc, :position)
    end
  end