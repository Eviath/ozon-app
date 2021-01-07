class Api::V1::ServicesController < ApplicationController
  include TokenAuthenticatable
  before_action :set_service, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @services = Service.all.order(:created_at)

    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = Service.create(service_params)
    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.permit(:title, :desc, :picture, :header)
  end
end