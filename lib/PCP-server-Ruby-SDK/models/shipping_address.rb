require_relative 'address_personal'

module PCPServerSDK
  module Models
    class ShippingAddress < AddressPersonal
      # Company name if needed
      attribute :company_name, :companyName, :String

      def self.openapi_all_of
        [:AddressPersonal]
      end
    end
  end
end
