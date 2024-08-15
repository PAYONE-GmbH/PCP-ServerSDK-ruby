require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # The Complete request is the last step to finalize the initially created Payment. It requires the completeFinancingPaymentMethodSpecificInput. The data for the order object should not differ from the previously provided information in Commerce Case, Checkout and Payment, but will not be validated nor automatically loaded from the Commerce Platform.
    class CompletePaymentRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CompleteFinancingPaymentMethodSpecificInput, nil]
      attr_accessor :financing_payment_method_specific_input

      # @return [PCPServerSDK::Models::Order, nil]
      attr_accessor :order

      # @return [PCPServerSDK::Models::CustomerDevice, nil]
      attr_accessor :device

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            financing_payment_method_specific_input == o.financing_payment_method_specific_input &&
            order == o.order &&
            device == o.device
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [financing_payment_method_specific_input, order, device].hash
      end

      def to_hash
        hash = {}
        hash['financingPaymentMethodSpecificInput'] = @financing_payment_method_specific_input.to_hash unless financing_payment_method_specific_input.nil?
        hash['order'] = @order.to_hash unless order.nil?
        hash['device'] = @device.to_hash unless device.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'financingPaymentMethodSpecificInput'
          @financing_payment_method_specific_input = CompleteFinancingPaymentMethodSpecificInput.new_from_hash(hash['financingPaymentMethodSpecificInput'])
        end
        if hash.key? 'order'
          @order = Order.new_from_hash(hash['order'])
        end
        if hash.key? 'device'
          @device = CustomerDevice.new_from_hash(hash['device'])
        end
      end
    end
  end
end
