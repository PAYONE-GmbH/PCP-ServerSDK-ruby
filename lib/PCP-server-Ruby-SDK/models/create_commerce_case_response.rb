require 'date'
require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # The response contains references to the created Commerce case and the Checkout. It also contains the payment response if the flag 'autoExecuteOrder' was set to true.
    class CreateCommerceCaseResponse < PCPServerSDK::ApiModel
      # Unique ID of the Commerce Case. It can used to add additional Checkouts to the Commerce Case.
      # @return [String, nil]
      attr_accessor :commerce_case_id

      # Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # @return [PCPServerSDK::Models::Customer, nil]
      attr_accessor :customer

      # @return [PCPServerSDK::Models::CheckoutResponse, nil]
      attr_accessor :checkout

      # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system.
      # @return [DateTime, nil]
      attr_accessor :creation_date_time

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            commerce_case_id == o.commerce_case_id &&
            merchant_reference == o.merchant_reference &&
            customer == o.customer &&
            checkout == o.checkout &&
            creation_date_time == o.creation_date_time
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [commerce_case_id, merchant_reference, customer, checkout, creation_date_time].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['commerceCaseId'] = @commerce_case_id unless @commerce_case_id.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['customer'] = @customer.to_hash unless @customer.nil?
        hash['checkout'] = @checkout.to_hash unless @checkout.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash
      end

      def from_hash(hash)
        @commerce_case_id = hash['commerceCaseId'] if hash.key? 'commerceCaseId'
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        if hash.key? 'customer'
          @customer = Customer.new_from_hash(hash['customer'])
        end
        if hash.key? 'checkout'
          @checkout = CheckoutResponse.new_from_hash(hash['checkout'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
      end
    end
  end
end
