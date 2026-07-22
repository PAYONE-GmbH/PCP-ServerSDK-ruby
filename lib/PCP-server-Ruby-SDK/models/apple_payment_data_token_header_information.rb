require_relative 'model_base'

module PCPServerSDK
  module Models
    class ApplePaymentDataTokenHeaderInformation < ModelBase
      # A hexadecimal Transaction identifier identifier as a string.
      attribute :transaction_id, :transactionId, :String
      # SHA–256 hash, hex encoded as a string. Hash of the applicationData property of the original PKPaymentRequest
      # object.
      attribute :application_data, :applicationData, :String
    end
  end
end
