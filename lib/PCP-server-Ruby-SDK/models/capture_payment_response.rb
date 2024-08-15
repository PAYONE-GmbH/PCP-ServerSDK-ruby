module PCPServerSDK
  module Models
    class CapturePaymentResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CaptureOutput, nil]
      attr_accessor :capture_output

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
            capture_output == o.capture_output &&
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
        [capture_output, status, status_output, id].hash
      end

      def to_hash
        hash = {}
        hash['captureOutput'] = @capture_output.to_hash unless @capture_output.nil?
        hash['status'] = @status unless @status.nil?
        hash['statusOutput'] = @status_output.to_hash unless @status_output.nil?
        hash['id'] = @id unless @id.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'captureOutput'
          @capture_output = CaptureOutput.new_from_hash(hash['captureOutput'])
        end
        if hash.key? 'status'
          @status = StatusValue.validate(hash['status'])
        end
        if hash.key? 'statusOutput'
          @status_output = PaymentStatusOutput.new_from_hash(hash['statusOutput'])
        end
        @id = hash['id'] if hash.key? 'id'
      end
    end
  end
end
