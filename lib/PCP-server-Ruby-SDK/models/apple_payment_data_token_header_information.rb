require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class ApplePaymentDataTokenHeaderInformation < PCPServerSDK::ApiModel
      # A hexadecimal Transaction identifier identifier as a string.
      # @return [String, nil]
      attr_accessor :transaction_id

      # SHA–256 hash, hex encoded as a string. Hash of the applicationData property of the original PKPaymentRequest object.
      # @return [String, nil]
      attr_accessor :application_data

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            transaction_id == o.transaction_id &&
            application_data == o.application_data
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [transaction_id, application_data].hash
      end

      def to_hash
        hash = {}
        hash['transactionId'] = @transaction_id unless @transaction_id.nil?
        hash['applicationData'] = @application_data unless @application_data.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @transaction_id = hash['transactionId'] if hash.key? 'transactionId'
        @application_data = hash['applicationData'] if hash.key? 'applicationData'
      end
    end
  end
end
