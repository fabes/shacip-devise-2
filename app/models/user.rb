require_relative 'devise'

class User
  include ActiveModel::Validations #required because some before_validations are defined in devise
  extend ActiveModel::Callbacks #required to define callbacks
  extend Devise::Models

  attr_accessor :email, :password

  define_model_callbacks :validation #required by Devise

  devise :remote_authenticatable, :timeoutable

  # Latest devise tries to initialize this class with values
  # ignore it for now
  def initialize(options={})
    remote_authentication options
  end
end