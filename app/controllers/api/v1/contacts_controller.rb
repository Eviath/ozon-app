class Api::V1::ContactsController < ApplicationController
  include TokenAuthenticatable
  skip_before_action :authenticate_user, only: [:index]

  def index
    @contacts = Contact::Block.all
    render json: @contacts
  end

  def update
    @contact = Contact::Block.find(params[:id])
    if @contact.update(contact_params)
      render json: Contact::Block.all
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :desc)
  end
end