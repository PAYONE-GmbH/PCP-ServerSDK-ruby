require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object that holds the payment related properties.
    class PaymentResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::ApiModel::PaymentOutput, nil]
      attr_accessor :payment_output

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusValue}
      # @return [String, nil]
      attr_accessor :status

      # @return [PCPServerSDK::Models::PaymentStatusOutput, nil]
      attr_accessor :status_output

      # Unique payment transaction identifier of the payment gateway.
      # @return [String, nil]
      attr_accessor :id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_output == o.payment_output &&
            status == o.status &&
            status_output == o.status_output &&
            id == o.id
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_output, status, status_output, id].hash
      end

      def to_hash
        hash = {}
        hash['paymentOutput'] = @payment_output.to_hash unless @payment_output.nil?
        hash['status'] = @status.value unless @status.nil?
        hash['statusOutput'] = @status_output.to_hash unless @status_output.nil?
        hash['id'] = @id unless @id.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'paymentOutput'
          @paymentOutput = PaymentOutput.from_hash(hash['paymentOutput']) if hash.key? 'paymentOutput'
        end
        if hash.key? 'status'
          @status = StatusValue.validate(hash['status'])
        end
        if hash.key? 'statusOutput'
          @status_output = StatusOutput.from_hash(hash['statusOutput']) if hash.key? 'statusOutput'
        end
        @id = hash['id'] if hash.key? 'id'
      end
    end
  end
end
