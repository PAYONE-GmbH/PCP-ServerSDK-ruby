require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class PaymentInformationRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentType}
      # @return [String, nil]
      attr_accessor :type

      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentChannel}
      attr_accessor :payment_channel

      # Payment method identifier - please check the product documentation for a full overview of possible values.
      # @return [Intege, nil]
      attr_accessor :payment_product_id

      # Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR or terminal will be used. It is always the reference for external transactions. (e.g. card present payments, cash payments or payments processed by other payment providers).
      # @return [String, nil]
      attr_accessor :merchant_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            type == o.type &&
            payment_channel == o.payment_channel &&
            payment_product_id == o.payment_product_id &&
            merchant_reference == o.merchant_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, type, payment_channel, payment_product_id, merchant_reference].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['type'] = @type unless @type.nil?
        hash['paymentChannel'] = @payment_channel unless @payment_channel.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'type'
          @type = PaymentType.validate(hash['type'])
        end
        if hash.key? 'paymentChannel'
          @payment_channel = PaymentChannel.validate(hash['paymentChannel'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
      end
    end
  end
end
