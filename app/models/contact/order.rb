class Contact::Order < ApplicationRecord
  validates_presence_of :name, :email, :message
end
