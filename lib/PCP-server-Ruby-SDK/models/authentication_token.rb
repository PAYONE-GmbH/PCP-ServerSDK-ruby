require_relative 'model_base'

module PCPServerSDK
  module Models
    class AuthenticationToken < ModelBase
      attribute :token, :token, :String
      attribute :id, :id, :String
      attribute :creation_date, :creationDate, :Time
      attribute :expiration_date, :expirationDate, :Time
    end
  end
end
