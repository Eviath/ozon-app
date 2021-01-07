class Api::V1::Pricing::BenefitsController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @benefits = Pricing::Benefit.all
    render json: @benefits
  end

  private

  def service_params
    params.require(:benefit).permit(:title, :traits, :picture)
  end
end