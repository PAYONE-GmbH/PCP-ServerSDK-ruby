require 'date'
require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class CreateCommerceCaseRequest < PCPServerSDK::ApiModel
      # Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # @return [PCPServerSDK::Models::Customer, nil]
      attr_accessor :customer

      # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system.
      # @return [DateTime, nil]
      attr_accessor :creation_date_time

      # @return [PCPServerSDK::Models::CreateCheckoutRequest, nil]
      attr_accessor :checkout

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            merchant_reference == o.merchant_reference &&
            customer == o.customer &&
            creation_date_time == o.creation_date_time &&
            checkout == o.checkout
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [merchant_reference, customer, creation_date_time, checkout].hash
      end

      def to_hash
        hash = {}
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['customer'] = @customer.to_hash unless @customer.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash['checkout'] = @checkout.to_hash unless @checkout.nil?
        hash
      end

      def from_hash(hash)
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        if hash.key? 'customer'
          @customer = Customer.new_from_hash(hash['customer'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
        if hash.key? 'checkout'
          @checkout = CreateCheckoutRequest.new_from_hash(hash['checkout'])
        end
      end
    end
  end
end
