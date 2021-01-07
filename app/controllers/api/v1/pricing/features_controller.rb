class Api::V1::Pricing::FeaturesController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @feature = Pricing::Feature.first
    render json: @feature
  end

  private

  def service_params
    params.require(:feature).permit(:title, :traits, :desc, :subtext, :picture)
  end
end