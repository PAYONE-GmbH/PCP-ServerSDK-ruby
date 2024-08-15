require 'date'
require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the reference of the Checkout for following requests.
    class CreateCheckoutResponse < PCPServerSDK::ApiModel
      # Reference to the Checkout. Can be used for following requests to get and update the Checkout and execute the payment.
      # @return [String, nil]
      attr_accessor :checkout_id

      # @return [PCPServerSDK::Models::ShoppingCartResult, nil]
      attr_accessor :shopping_cart

      # @return [PCPServerSDK::Models::CreatePaymentResponse, nil]
      attr_accessor :payment_response

      # @return [PCPServerSDK::Models::ErrorResponse, nil]
      attr_accessor :error_response

      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::CheckoutReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::Shipping, nil]
      attr_accessor :shipping

      # @return [PCPServerSDK::Models::PaymentExecution, nil]
      attr_accessor :payment_execution

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusCheckout}
      # @return [String, nil]
      attr_accessor :checkout_status

      # @return [PCPServerSDK::Models::StatusOutput, nil]
      attr_accessor :status_output

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
            checkout_id == o.checkout_id &&
            shopping_cart == o.shopping_cart &&
            payment_response == o.payment_response &&
            error_response == o.error_response &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            shipping == o.shipping &&
            payment_execution == o.payment_execution &&
            checkout_status == o.checkout_status &&
            status_output == o.status_output &&
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
        [checkout_id, shopping_cart, payment_response, error_response, amount_of_money, references, shipping, payment_execution, checkout_status, status_output, creation_date_time, allowed_payment_actions].hash
      end

      def to_hash
        hash = {}
        hash['checkoutId'] = @checkout_id unless @checkout_id.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash['paymentResponse'] = @payment_response.to_hash unless @payment_response.nil?
        hash['errorResponse'] = @error_response.to_hash unless @error_response.nil?
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['shipping'] = @shipping.to_hash unless @shipping.nil?
        hash['paymentExecution'] = @payment_execution.to_hash unless @payment_execution.nil?
        hash['checkoutStatus'] = @checkout_status unless @checkout_status.nil?
        hash['statusOutput'] = @status_output.to_hash unless @status_output.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash['allowedPaymentActions'] = @allowed_payment_actions unless @allowed_payment_actions.nil?
        hash
      end

      def from_hash(hash)
        @checkout_id = hash['checkoutId'] if hash.key? 'checkoutId'
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartResult.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'paymentResponse'
          @payment_response = PaymentResponse.new_from_hash(hash['paymentResponse'])
        end
        if hash.key? 'errorResponse'
          @error_response = ErrorResponse.new_from_hash(hash['errorResponse'])
        end
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          @references = CheckoutReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          @shipping = Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'paymentExecution'
          @payment_execution = PaymentExecution.new_from_hash(hash['paymentExecution'])
        end
        if hash.key? 'checkoutStatus'
          @checkout_status = StatusCheckout.validate(hash['checkoutStatus'])
        end
        if hash.key? 'statusOutput'
          @status_output = StatusOutput.new_from_hash(hash['statusOutput'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
        if hash.key? 'allowedPaymentActions'
          @allowed_payment_actions = AllowedPaymentActions.validate_array(hash['allowedPaymentActions'])
        end
      end
    end
  end
end
