class BenefitSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :traits, :picture

  def traits
    object.traits.split(', ')
  end

end
