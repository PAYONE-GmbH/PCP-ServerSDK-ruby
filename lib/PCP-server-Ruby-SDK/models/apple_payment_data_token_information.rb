require_relative 'model_base'

module PCPServerSDK
  module Models
    class ApplePaymentDataTokenInformation < ModelBase
      # Version information about the payment token. Currently only EC_v1 for ECC-encrypted data is supported.
      attribute :version, :version, :String, enum: ["EC_V1"]
      # Detached PKCS #7 signature, Base64 encoded as string. Signature of the payment and header data. The
      # signature includes the signing certificate, its intermediate CA certificate, and information about the
      # signing algorithm.
      attribute :signature, :signature, :String
      attribute :header, :header, :ApplePaymentDataTokenHeaderInformation
    end
  end
end
