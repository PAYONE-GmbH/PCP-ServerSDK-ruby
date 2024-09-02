module PCPServerSDK
  module Models
    class ApplePayPaymentMethodType
      DEBIT = "debit"
      CREDIT = "credit"
      PREPAID = "prepaid"
      STORE = "store"
      
      def self.all_types
        [DEBIT, CREDIT, PREPAID, STORE]
      end
      
      def self.valid?(value)
        all_types.include?(value)
      end
    end
           
  end
end
