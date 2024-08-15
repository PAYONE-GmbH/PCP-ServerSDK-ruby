require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object contains information of the payment with a specific payment method.
    class PaymentExecution < PCPServerSDK::ApiModel
      # Unique ID of paymentExecution.
      # @return [String, nil]
      attr_accessor :payment_execution_id

      # Unique payment transaction identifier of the payment gateway.
      # @return [String, nil]
      attr_accessor :payment_id

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

      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentChannel}
      # @return [String, nil]
      attr_accessor :payment_channel

      # @return [PCPServerSDK::Models::References, nil]
      attr_accessor :references

      # @return [Array<PCPServerSDK::Models::PaymentEvent>, nil]
      attr_accessor :events

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_execution_id, payment_id, card_payment_method_specific_input, mobile_payment_method_specific_input, redirect_payment_method_specific_input, sepa_direct_debit_payment_method_specific_input, financing_payment_method_specific_input, payment_channel, references, events].hash
      end

      def to_hash
        hash = {}
        hash['paymentExecutionId'] = @payment_execution_id unless @payment_execution_id.nil?
        hash['paymentId'] = @payment_id unless @payment_id.nil?
        hash['cardPaymentMethodSpecificInput'] = @card_payment_method_specific_input.to_hash unless @card_payment_method_specific_input.nil?
        hash['mobilePaymentMethodSpecificInput'] = @mobile_payment_method_specific_input.to_hash unless @mobile_payment_method_specific_input.nil?
        hash['redirectPaymentMethodSpecificInput'] = @redirect_payment_method_specific_input.to_hash unless @redirect_payment_method_specific_input.nil?
        hash['sepaDirectDebitPaymentMethodSpecificInput'] = @sepa_direct_debit_payment_method_specific_input.to_hash unless @sepa_direct_debit_payment_method_specific_input.nil?
        hash['financingPaymentMethodSpecificInput'] = @financing_payment_method_specific_input.to_hash unless @financing_payment_method_specific_input.nil?
        hash['paymentChannel'] = @payment_channel unless @payment_channel.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['events'] = @events.map(&:to_hash) unless @events.nil?
        hash
      end

      def from_hash(hash)
        @payment_execution_id = hash['paymentExecutionId'] if hash.key? 'paymentExecutionId'
        @payment_id = hash['paymentId'] if hash.key? 'paymentId'
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
        if hash.key? 'paymentChannel'
          @payment_channel = PaymentChannel.validate(hash['paymentChannel'])
        end
        if hash.key? 'references'
          @references = References.new_from_hash(hash['references'])
        end
        if hash.key? 'events'
          @events = PaymentEvent.new_from_hash_array(hash['events'])
        end
      end
    end
  end
end
