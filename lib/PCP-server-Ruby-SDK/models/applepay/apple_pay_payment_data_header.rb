
module PCPServerSDK
  module Models
    class ApplePayPaymentDataHeader
      # @param [String] application_data
      # @param [String] ephemeral_public_key
      # @param [String] wrapped_key
      # @param [String] public_key_hash
      # @param [String] transaction_id
      attr_accessor :application_data, :ephemeral_public_key, :wrapped_key, :public_key_hash, :transaction_id
        
      def initialize(application_data: nil, ephemeral_public_key: nil, wrapped_key: nil, public_key_hash: nil, transaction_id: nil)
        @application_data = application_data
        @ephemeral_public_key = ephemeral_public_key
        @wrapped_key = wrapped_key
        @public_key_hash = public_key_hash
        @transaction_id = transaction_id
      end
    end
          
  end
end
