require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing specific information for PAYONE Secured Installment.
    class PaymentProduct3391SpecificOutput < PCPServerSDK::ApiModel
      # List of installment options.
      # @return [Array<InstallmentOption>, nil]
      attr_accessor :installment_options

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            installment_options == o.installment_options
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [installment_options].hash
      end

      def to_hash
        hash = {}
        hash['installmentOptions'] = @installment_options.map(&:to_hash) unless @installment_options.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'installmentOptions'
          @installment_options = InstallmentOption.new_from_hash_array(hash['installmentOptions'])
        end
      end
    end
  end
end
