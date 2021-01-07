class Api::V1::Pricing::MainsController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @mains = Pricing::Main.all
    render json: @mains
  end

  private

  def service_params
    params.require(:main).permit(:title, :traits, :picture)
  end
end