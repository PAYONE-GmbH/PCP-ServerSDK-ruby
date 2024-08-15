require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Input for the payment for a respective payment method. In case the paymentMethodSpecificInput has already been provided when creating the Commerce Case or Checkout, it will automatically be used for the Payment Execution. If a new input will be provided, the existing input will be updated.
    class PaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CardPaymentMethodSpecificInput, nil]
      attr_accessor :card_payment_method_specific_input

      # @return [PCPServerSDK::Models::MobilePaymentMethodSpecificInput, nil]
      attr_accessor :mobile_payment_method_specific_input

      # @return [PCPServerSDK::Models::RedirectPaymentMethodSpecificInput, nil]
      attr_accessor :redirect_payment_method_specific_input

      # @return [PCPServerSDK::Models::SepaDirectDebitPaymentMethodSpecificInput, nil]
      attr_accessor :sepa_direct_debit_payment_method_specific_input

      # @return [PCPServerSDK::Models::FinancingPaymentMethodSpecificInput, nil]
      attr_accessor :financing_payment_method_specific_input

      # @return [PCPServerSDK::Models::CustomerDevice, nil]
      attr_accessor :customer_device

      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentChannel}
      # @return [String, nil]
      attr_accessor :payment_channel

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            card_payment_method_specific_input == o.card_payment_method_specific_input &&
            mobile_payment_method_specific_input == o.mobile_payment_method_specific_input &&
            redirect_payment_method_specific_input == o.redirect_payment_method_specific_input &&
            sepa_direct_debit_payment_method_specific_input == o.sepa_direct_debit_payment_method_specific_input &&
            financing_payment_method_specific_input == o.financing_payment_method_specific_input &&
            customer_device == o.customer_device &&
            payment_channel == o.payment_channel
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [card_payment_method_specific_input, mobile_payment_method_specific_input, redirect_payment_method_specific_input, sepa_direct_debit_payment_method_specific_input, financing_payment_method_specific_input, customer_device, payment_channel].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_hash unless @card_payment_method_specific_input.nil?
        hash['mobilePaymentMethodSpecificInput'] = @mobile_payment_method_specific_input.to_hash unless @mobile_payment_method_specific_input.nil?
        hash['redirectPaymentMethodSpecificInput'] = @redirect_payment_method_specific_input.to_hash unless @redirect_payment_method_specific_input.nil?
        hash['sepaDirectDebitPaymentMethodSpecificInput'] = @sepa_direct_debit_payment_method_specific_input.to_hash unless @sepa_direct_debit_payment_method_specific_input.nil?
        hash['financingPaymentMethodSpecificInput'] = @financing_payment_method_specific_input.to_hash unless @financing_payment_method_specific_input.nil?
        hash['customerDevice'] = @customer_device.to_hash unless @customer_device.nil?
        hash['paymentChannel'] = @payment_channel unless @payment_channel.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'cardPaymentMethodSpecificInput'
          @card_payment_method_specific_input = CardPaymentMethodSpecificInput.new_from_hash(hash['cardPaymentMethodSpecificInput'])
        end
        if hash.key? 'mobilePaymentMethodSpecificInput'
          @mobile_payment_method_specific_input = MobilePaymentMethodSpecificInput.new_from_hash(hash['mobilePaymentMethodSpecificInput'])
        end
        if hash.key? 'redirectPaymentMethodSpecificInput'
          @redirect_payment_method_specific_input = RedirectPaymentMethodSpecificInput.new_from_hash(hash['redirectPaymentMethodSpecificInput'])
        end
        if hash.key? 'sepaDirectDebitPaymentMethodSpecificInput'
          @sepa_direct_debit_payment_method_specific_input = SepaDirectDebitPaymentMethodSpecificInput.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificInput'])
        end
        if hash.key? 'financingPaymentMethodSpecificInput'
          @financing_payment_method_specific_input = FinancingPaymentMethodSpecificInput.new_from_hash(hash['financingPaymentMethodSpecificInput'])
        end
        if hash.key? 'customerDevice'
          @customer_device = CustomerDevice.new_from_hash(hash['customerDevice'])
        end
        @payment_channel = PaymentChannel.validate(hash['paymentChannel']) if hash.key? 'paymentChannel'
      end
    end
  end
end
