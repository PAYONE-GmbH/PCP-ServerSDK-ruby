require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing payment details.
    class PaymentOutput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # It allows you to store additional parameters for the transaction in JSON format. This field should not contain any personal data.
      # @return [String, nil]
      attr_accessor :merchant_parameters

      # @return [PCPServerSDK::Models::PaymentReferences, nil]
      attr_accessor :references

      # Payment method identifier based on the paymentProductId.
      # @return [String, nil]
      attr_accessor :payment_method

      # @return [PCPServerSDK::Models::CardPaymentMethodSpecificOutput, nil]
      attr_accessor :card_payment_method_specific_output

      # @return [PCPServerSDK::Models::MobilePaymentMethodSpecificOutput, nil]
      attr_accessor :mobile_payment_method_specific_output

      # @return [PCPServerSDK::Models::RedirectPaymentMethodSpecificOutput, nil]
      attr_accessor :redirect_payment_method_specific_output

      # @return [PCPServerSDK::Models::SepaDirectDebitPaymentMethodSpecificOutput, nil]
      attr_accessor :sepa_direct_debit_payment_method_specific_output

      # @return [PCPServerSDK::Models::FinancingPaymentMethodSpecificOutput, nil]
      attr_accessor :financing_payment_method_specific_output

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            merchant_parameters == o.merchant_parameters &&
            references == o.references &&
            card_payment_method_specific_output == o.card_payment_method_specific_output &&
            mobile_payment_method_specific_output == o.mobile_payment_method_specific_output &&
            payment_method == o.payment_method &&
            redirect_payment_method_specific_output == o.redirect_payment_method_specific_output &&
            sepa_direct_debit_payment_method_specific_output == o.sepa_direct_debit_payment_method_specific_output &&
            financing_payment_method_specific_output == o.financing_payment_method_specific_output
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, merchant_parameters, references, card_payment_method_specific_output, mobile_payment_method_specific_output, payment_method, redirect_payment_method_specific_output, sepa_direct_debit_payment_method_specific_output, financing_payment_method_specific_output].hash
      end

      # Returns the string representation of the object
      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['paymentMethod'] = @payment_method unless @payment_method.nil?
        hash['cardPaymentMethodSpecificOutput'] = @card_payment_method_specific_output.to_hash unless @card_payment_method_specific_output.nil?
        hash['mobilePaymentMethodSpecificOutput'] = @mobile_payment_method_specific_output.to_hash unless @mobile_payment_method_specific_output.nil?
        hash['redirectPaymentMethodSpecificOutput'] = @redirect_payment_method_specific_output.to_hash unless @redirect_payment_method_specific_output.nil?
        hash['sepaDirectDebitPaymentMethodSpecificOutput'] = @sepa_direct_debit_payment_method_specific_output.to_hash unless @sepa_direct_debit_payment_method_specific_output.nil?
        hash['financingPaymentMethodSpecificOutput'] = @financing_payment_method_specific_output.to_hash unless @financing_payment_method_specific_output.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        @merchant_parameters = hash['merchantParameters'] if hash.key? 'merchantParameters'
        if hash.key? 'references'
          @references = References.new_from_hash(hash['references'])
        end
        @payment_method = hash['paymentMethod'] if hash.key? 'paymentMethod'
        if hash.key? 'cardPaymentMethodSpecificOutput'
          @card_payment_method_specific_output = CardPaymentMethodSpecificOutput.new_from_hash(hash['cardPaymentMethodSpecificOutput'])
        end
        if hash.key? 'mobilePaymentMethodSpecificOutput'
          @mobile_payment_method_specific_output = MobilePaymentMethodSpecificOutput.new_from_hash(hash['mobilePaymentMethodSpecificOutput'])
        end
        if hash.key? 'redirectPaymentMethodSpecificOutput'
          @redirect_payment_method_specific_output = RedirectPaymentMethodSpecificOutput.new_from_hash(hash['redirectPaymentMethodSpecificOutput'])
        end
        if hash.key? 'sepaDirectDebitPaymentMethodSpecificOutput'
          @sepa_direct_debit_payment_method_specific_output = SepaDirectDebitPaymentMethodSpecificOutput.new_from_hash(hash['sepaDirectDebitPaymentMethodSpecificOutput'])
        end
        if hash.key? 'financingPaymentMethodSpecificOutput'
          @financing_payment_method_specific_output = FinancingPaymentMethodSpecificOutput.new_from_hash(hash['financingPaymentMethodSpecificOutput'])
        end
      end
    end
  end
end
