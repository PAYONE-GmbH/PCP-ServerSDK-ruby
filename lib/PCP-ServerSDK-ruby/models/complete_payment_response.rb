require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    class CompletePaymentResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::PaymentCreationOutput, nil]
      attr_accessor :creation_output

      # @return [PCPServerSDK::Models::MerchantAction, nil]
      attr_accessor :merchant_action

      # @return [PCPServerSDK::Models::PaymentResponse, nil]
      attr_accessor :payment

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            creation_output == o.creation_output &&
            merchant_action == o.merchant_action &&
            payment == o.payment
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [creation_output, merchant_action, payment].hash
      end

      def to_hash
        hash = {}
        hash['creationOutput'] = @creation_output.to_hash unless creation_output.nil?
        hash['merchantAction'] = @merchant_action.to_hash unless merchant_action.nil?
        hash['payment'] = @payment.to_hash unless payment.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'creationOutput'
          @creation_output = PaymentCreationOutput.new_from_hash(hash['creationOutput'])
        end
        if hash.key? 'merchantAction'
          @merchant_action = MerchantAction.new_from_hash(hash['merchantAction'])
        end
        if hash.key? 'payment'
          @payment = PaymentResponse.new_from_hash(hash['payment'])
        end
      end
    end
  end
end
