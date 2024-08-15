require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the related data of the created Payment Information.
    class PaymentInformationResponse < PCPServerSDK::ApiModel
      # Unique ID of the Commerce Case.
      # @return [String, nil]
      attr_accessor :commerce_case_id

      # Unique ID of the Commerce Case.
      # @return [String, nil]
      attr_accessor :checkout_id

      # Unique identifier of the customer.
      # @return [String, nil]
      attr_accessor :merchant_customer_id

      # Unique ID of the Payment Information.
      # @return [String, nil]
      attr_accessor :payment_information_id

      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentChannel}
      # @return [String, nil]
      attr_accessor :payment_channel

      # Payment product identifier - please check see product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # Unique identifier of the POS terminal of the payment transaction.
      # @return [String, nil]
      attr_accessor :terminal_id

      # Unique ID that identifies a store location or transaction point and which refers to the contract number of the merchant accepting the card.
      # @return [String, nil]
      attr_accessor :card_acceptor_id

      # Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR or terminal will be used. It is always the reference for external transactions. (e.g. card present payments, cash payments or payments processed by other payment providers).
      # @return [String, nil]
      attr_accessor :merchant_reference

      # @return [PCPServerSDK::Models::CardPaymentDetails, nil]
      attr_accessor :card_payment_details

      # @return [Array<PCPServerSDK::Models::PaymentEvent>, nil]
      attr_accessor :events

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            commerce_case_id == o.commerce_case_id &&
            checkout_id == o.checkout_id &&
            merchant_customer_id == o.merchant_customer_id &&
            payment_information_id == o.payment_information_id &&
            payment_channel == o.payment_channel &&
            payment_product_id == o.payment_product_id &&
            terminal_id == o.terminal_id &&
            card_acceptor_id == o.card_acceptor_id &&
            merchant_reference == o.merchant_reference &&
            card_payment_details == o.card_payment_details &&
            events == o.events
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [commerce_case_id, checkout_id, merchant_customer_id, payment_information_id, payment_channel, payment_product_id, terminal_id, card_acceptor_id, merchant_reference, card_payment_details, events].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['commerceCaseId'] = @commerce_case_id unless @commerce_case_id.nil?
        hash['checkoutId'] = @checkout_id unless @checkout_id.nil?
        hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
        hash['paymentInformationId'] = @payment_information_id unless @payment_information_id.nil?
        hash['paymentChannel'] = @payment_channel unless @payment_channel.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['terminalId'] = @terminal_id unless @terminal_id.nil?
        hash['cardAcceptorId'] = @card_acceptor_id unless @card_acceptor_id.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['cardPaymentDetails'] = @card_payment_details.to_hash
        hash['events'] = @events.map(&:to_hash)
        hash
      end

      def from_hash(hash)
        @commerce_case_id = hash['commerceCaseId'] if hash.key? 'commerceCaseId'
        @checkout_id = hash['checkoutId'] if hash.key? 'checkoutId'
        @merchant_customer_id = hash['merchantCustomerId'] if hash.key? 'merchantCustomerId'
        @payment_information_id = hash['paymentInformationId'] if hash.key? 'paymentInformationId'
        if hash.key? 'paymentChannel'
          @payment_channel = PaymentChannel.validate(hash['paymentChannel'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @terminal_id = hash['terminalId'] if hash.key? 'terminalId'
        @card_acceptor_id = hash['cardAcceptorId'] if hash.key? 'cardAcceptorId'
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        if hash.key? 'cardPaymentDetails'
          @card_payment_details = CardPaymentDetails.new_from_hash(hash['cardPaymentDetails'])
        end
        if hash.key? 'events'
          @events = PaymentEvent.new_from_hash_array(hash['events'])
        end
      end
    end
  end
end
