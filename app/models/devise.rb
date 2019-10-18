module Devise
  module Models
    module RemoteAuthenticatable
      extend ActiveSupport::Concern

      #
      # Here you do the request to the external webservice
      #
      # If the authentication is successful you should return
      # a resource instance
      #
      # If the authentication fails you should return false
      #
      def remote_authentication(authentication_hash)
        params = {
          'username' => authentication_hash[:email],
          'password' => authentication_hash[:password]
        }

        endorsement = Shacip::Client::Endorsement.create(params)
        return false unless endorsement.recognized

        self.email = authentication_hash[:email]
        self
      end

      module ClassMethods
        def serialize_from_session(data, salt)
          resource = self.new
          resource.email = data['email']
          resource
        end

        def serialize_into_session(record)
          [
            {
              :email => record.email
            },
            nil
          ]
        end
      end
    end
  end
end
