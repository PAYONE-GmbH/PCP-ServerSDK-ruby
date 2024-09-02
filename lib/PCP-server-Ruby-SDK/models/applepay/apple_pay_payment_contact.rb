module PCPServerSDK
  module Models
    class ApplePayPaymentContact
      # @param [String] phone_number
      # @param [String] email_address
      # @param [String] given_name
      # @param [String] family_name
      # @param [String] phonetic_given_name
      # @param [String] phonetic_family_name
      # @param [Array<String>] address_lines
      # @param [String] locality
      # @param [String] postal_code
      # @param [String] administrative_area
      # @param [String] sub_administrative_area
      # @param [String] country
      # @param [String] country_code
      attr_accessor :phone_number, :email_address, :given_name, :family_name,
                    :phonetic_given_name, :phonetic_family_name, :address_lines,
                    :locality, :postal_code, :administrative_area, :sub_administrative_area,
                    :country, :country_code
    
      def initialize(phone_number: nil, email_address: nil, given_name: nil, family_name: nil,
                     phonetic_given_name: nil, phonetic_family_name: nil, address_lines: [],
                     locality: nil, postal_code: nil, administrative_area: nil,
                     sub_administrative_area: nil, country: nil, country_code: nil)
        @phone_number = phone_number
        @email_address = email_address
        @given_name = given_name
        @family_name = family_name
        @phonetic_given_name = phonetic_given_name
        @phonetic_family_name = phonetic_family_name
        @address_lines = address_lines
        @locality = locality
        @postal_code = postal_code
        @administrative_area = administrative_area
        @sub_administrative_area = sub_administrative_area
        @country = country
        @country_code = country_code
      end
    end    
  end
end
