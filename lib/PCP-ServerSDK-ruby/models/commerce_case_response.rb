require 'date'
require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    class CommerceCaseResponse < PCPServerSDK::ApiModel
      # Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # Unique ID reference of the Commerce Case. It can be used to add additional Checkouts to the Commerce Case.
      # @return [String, nil]
      attr_accessor :commerce_case_id

      # @return [PCPServerSDK::Models::Customer, nil]
      attr_accessor :customer

      # @return [Array<PCPServerSDK::Models::CheckoutResponse>, nil]
      attr_accessor :checkouts

      # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system.
      # @return [DateTime, nil]
      attr_accessor :creation_date_time

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            merchant_reference == o.merchant_reference &&
            commerce_case_id == o.commerce_case_id &&
            customer == o.customer &&
            checkouts == o.checkouts &&
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
        [merchant_reference, commerce_case_id, customer, checkouts, creation_date_time].hash
      end

      def to_hash
        hash = {}
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['commerceCaseId'] = @commerce_case_id unless @commerce_case_id.nil?
        hash['customer'] = @customer.to_hash unless @customer.nil?
        hash['checkouts'] = @checkouts.map(&:to_hash) unless @checkouts.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash
      end

      def from_hash(hash)
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        @commerce_case_id = hash['commerceCaseId'] if hash.key? 'commerceCaseId'
        if hash.key? 'customer'
          @customer = Customer.new_from_hash(hash['customer'])
        end
        if hash.key? 'checkouts'
          @checkouts = CheckoutsResponse.new_from_hash_array(hash['checkouts'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
      end
    end
  end
end
