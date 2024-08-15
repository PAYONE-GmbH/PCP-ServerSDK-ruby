require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing contact details like email address and phone number.
    class ContactDetails < PCPServerSDK::ApiModel
      # Email address of the customer
      # @return [String, nil]
      attr_accessor :email_address

      # Phone number of the customer
      # @return [String, nil]
      attr_accessor :phone_number

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            email_address == o.email_address &&
            phone_number == o.phone_number
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [email_address, phone_number].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['emailAddress'] = @email_address unless @email_address.nil?
        hash['phoneNumber'] = @phone_number unless @phone_number.nil?
        hash
      end

      def from_hash(hash)
        @email_address = hash['emailAddress'] if hash.key? 'emailAddress'
        @phone_number = hash['phoneNumber'] if hash.key? 'phoneNumber'
      end
    end
  end
end
