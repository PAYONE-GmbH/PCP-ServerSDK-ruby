require_relative 'model_base'

module PCPServerSDK
  module Models
    class ContactDetails < ModelBase
      # Email address of the customer
      attribute :email_address, :emailAddress, :String
      # Phone number of the customer
      attribute :phone_number, :phoneNumber, :String
    end
  end
end
