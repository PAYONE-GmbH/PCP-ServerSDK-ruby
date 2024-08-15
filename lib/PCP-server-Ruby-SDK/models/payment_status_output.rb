require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # This object has the numeric representation of the current payment status, timestamp of last status change and performable action on the current payment resource. In case of failed payments and negative scenarios, detailed error information is listed.
    class PaymentStatusOutput < PCPServerSDK::ApiModel
      # Flag indicating if the payment can be cancelled
      # @return [Boolean, nil]
      attr_accessor :is_cancellable

      # @return [PCPServerSDK::Models::StatusCategoryValue, nil]
      attr_accessor :status_category

      # Indicates if the transaction has been authorized
      # @return [Boolean, nil]
      attr_accessor :is_authorized

      # Flag indicating if the payment can be refunded
      # @return [Boolean, nil]
      attr_accessor :is_refundable

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            is_cancellable == o.is_cancellable &&
            status_category == o.status_category &&
            is_authorized == o.is_authorized &&
            is_refundable == o.is_refundable
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [is_cancellable, status_category, is_authorized, is_refundable].hash
      end

      def to_hash
        hash = {}
        hash['isCancellable'] = @is_cancellable unless @is_cancellable.nil?
        hash['statusCategory'] = @status_category unless @status_category.nil?
        hash['isAuthorized'] = @is_authorized unless @is_authorized.nil?
        hash['is_refundable'] = @is_refundable unless @is_refundable.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @is_cancellable = hash['isCancellable'] if hash.key? 'isCancellable'
        if hash.key? 'statusCategory'
          @status_category = StatusCategoryValue.new_from_hash(hash['statusCategory'])
        end
        @is_authorized = hash['isAuthorized'] if hash.key? 'isAuthorized'
        @is_refundable = hash['isRefundable'] if hash.key? 'isRefundable'
      end
    end
  end
end
