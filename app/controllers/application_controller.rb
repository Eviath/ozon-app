class ApplicationController < ActionController::API

  include ActionController::MimeResponds

  def index
    respond_to do |format|
      format.html { render body: Rails.root.join('public/index.html').read }
    end
  end

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  class NotAuthorizedException < StandardError; end

  module TokenAuthenticatable
    extend ActiveSupport::Concern

    included do
      attr_reader :current_user

      before_action :authenticate_user

      rescue_from NotAuthorizedException, with: -> { render json: { error: 'Not Authorized' }, status: 401 }
    end

    private

    def authenticate_user
      @current_user = DecodeAuthenticationCommand.call(request.headers).result
      raise NotAuthorizedException unless @current_user
    end
  end
end
