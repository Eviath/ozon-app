class FeatureSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :traits, :subtext, :desc, :picture


end
