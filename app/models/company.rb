class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :active, type: Boolean, default: true
  field :name, type: String
  field :phone, type: String
  field :email, type: String

  has_many :users

end
