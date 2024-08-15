require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object that holds the payment related properties for the refund of a Payment Information.
    class PayoutResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::PayoutOutput, nil]
      attr_accessor :payout_output

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusValue}
      # @return [String, nil]
      attr_accessor :status

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusCategoryValue}
      # @return [String, nil]
      attr_accessor :status_category

      # Unique payment transaction identifier of the payment gateway.
      # @return [String, nil]
      attr_accessor :id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payout_output == o.payout_output &&
            status == o.status &&
            status_category == o.status_category &&
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
        [payout_output, status, status_category, id].hash
      end

      def to_hash
        hash = {}
        hash['payoutOutput'] = @payout_output.to_hash unless @payout_output.nil?
        hash['status'] = @status unless @status.nil?
        hash['statusCategory'] = @status_category unless @status_category.nil?
        hash['id'] = @id unless @id.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'payoutOutput'
          @payout_output = PayoutOutput.new_from_(hash['payoutOutput'])
        end
        if hash.key? 'status'
          @status = StatusValue.validate(hash['status'])
        end
        if hash.key? 'statusCategory'
          @status_category = StatusCategoryValue.validate(hash['statusCategory'])
        end
        @id = hash['id'] if hash.key? 'id'
      end
    end
  end
end
