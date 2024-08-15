require 'date'
require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # The Checkout corresponds to the order of the WL API. We do not take additionalInput from the WL API. We have no  shipping and use deliveryAddress instead of address.
    class CheckoutResponse < PCPServerSDK::ApiModel
      # reference to the Commerce Case.
      # @return [String, nil]
      attr_accessor :commerce_case_id

      # reference to the Checkout.
      # @return [String, nil]
      attr_accessor :checkout_id

      # Unique identifier for the customer.
      # @return [String, nil]
      attr_accessor :merchant_customer_id

      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::CheckoutReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::Shipping, nil]
      attr_accessor :shipping

      # @return [PCPServerSDK::Models::ShoppingCartResult, nil]
      attr_accessor :shopping_cart

      # @return [Array<PCPServerSDK::Models::PaymentExecution>, nil]
      attr_accessor :payment_executions

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusCheckout}
      # @return [String, nil]
      attr_accessor :checkout_status

      # @return [PCPServerSDK::Models::StatusOutput, nil]
      attr_accessor :status_output

      # @return [Array<PCPServerSDK::Models::PaymentInformationResponse>, nil]
      attr_accessor :payment_information

      # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system.
      # @return [DateTime, nil]
      attr_accessor :creation_date_time

      # Items should be one of the string constants provided by {PCPServerSDK::Models::AllowedPaymentActions}
      # @return [Array<String>, nil]
      attr_accessor :allowed_payment_actions

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            commerce_case_id == o.commerce_case_id &&
            checkout_id == o.checkout_id &&
            merchant_customer_id == o.merchant_customer_id &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            shipping == o.shipping &&
            shopping_cart == o.shopping_cart &&
            payment_executions == o.payment_executions &&
            checkout_status == o.checkout_status &&
            status_output == o.status_output &&
            payment_information == o.payment_information &&
            creation_date_time == o.creation_date_time &&
            allowed_payment_actions == o.allowed_payment_actions
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [commerce_case_id, checkout_id, merchant_customer_id, amount_of_money, references, shipping, shopping_cart, payment_executions, checkout_status, status_output, payment_information, creation_date_time, allowed_payment_actions].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['commerceCaseId'] = @commerce_case_id unless @commerce_case_id.nil?
        hash['checkoutId'] = @checkout_id unless @checkout_id.nil?
        hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['shipping'] = @shipping.to_hash unless @shipping.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash['paymentExecutions'] = @payment_executions.map(&:to_hash) unless @payment_executions.nil?
        hash['checkoutStatus'] = @checkout_status unless @checkout_status.nil?
        hash['statusOutput'] = @status_output.to_hash unless @status_output.nil?
        hash['paymentInformation'] = @payment_information.map(&:to_hash) unless @payment_information.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash['allowedPaymentActions'] = @allowed_payment_actions unless @allowed_payment_actions.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @commerce_case_id = hash['commerceCaseId'] if hash.key? 'commerceCaseId'
        @checkout_id = hash['checkoutId'] if hash.key? 'checkoutId'
        @merchant_customer_id = hash['merchantCustomerId'] if hash.key? 'merchantCustomerId'
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          @references = CheckoutReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          @shipping = Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartResult.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'paymentExecutions'
          @payment_executions = PaymentExecution.new_from_hash_array(hash['paymentExecutions'])
        end
        if hash.key? 'checkoutStatus'
          @checkout_status = StatusCheckout.validate(hash['checkoutStatus'])
        end
        if hash.key? 'statusOutput'
          @status_output = StatusOutput.new_from_hash(hash['statusOutput'])
        end
        if hash.key? 'paymentInformation'
          @payment_information = PaymentInformationResponse.new_from_hash_array(hash['paymentInformation'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
        @allowed_payment_actions = AllowedPaymentActions.validate_array(hash['allowedPaymentActions']) if hash.key? 'allowedPaymentActions'
      end
    end
  end
end
