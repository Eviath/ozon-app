class Api::V1::ImagesController < ApplicationController
  include Rails.application.routes.url_helpers
  def upload
    @upload = Upload.create
    @upload.files.attach(params['file'])
    if @upload.save
      render plain: @upload.files.first
    end
  end
end