require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # This object has the numeric representation of the current Refund status, timestamp of last status change and performable action on the current Refund resource. In case of a rejected Refund, detailed error information is listed.
    class RefundPaymentResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::RefundOutput, nil]
      attr_accessor :refund_output

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusValue}
      # @return [String, nil]
      attr_accessor :status

      # @return [PCPServerSDK::Models::PaymentStatusOutput, nil]
      attr_accessor :status_output

      # @return [String, nil]
      attr_accessor :id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            refund_output == o.refund_output &&
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
        [refund_output, status, status_output, id].hash
      end

      def to_hash
        hash = {}
        hash['refundOutput'] = @refund_output.to_hash unless @refund_output.nil?
        hash['status'] = @status unless @status.nil?
        hash['statusOutput'] = @status_output.to_hash unless @status_output.nil?
        hash['id'] = @id unless @id.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'refundOutput'
          @refund_output = RefundOutput.new_from_hash(hash['refundOutput'])
        end
        if hash.key? 'status'
          @status = StatusValue.validate(hash['status'])
        end
        if hash.key? 'statusOutput'
          @status_output = PaymentStatusOutput.new_from_(hash['statusOutput'])
        end
        @id = hash['id'] if hash.key? 'id'
      end
    end
  end
end
