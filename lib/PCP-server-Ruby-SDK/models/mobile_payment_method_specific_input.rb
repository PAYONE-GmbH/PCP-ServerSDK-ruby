require_relative 'model_base'

module PCPServerSDK
  module Models
    class MobilePaymentMethodSpecificInput < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :authorization_mode, :authorizationMode, :AuthorizationMode
      # The payment data if we will do the decryption of the encrypted payment data. Typically you'd use
      # encryptedCustomerInput in the root of the create payment request to provide the encrypted payment data
      # instead.
      attribute :encrypted_payment_data, :encryptedPaymentData, :String
      # Public Key Hash A unique identifier to retrieve key used by Apple to encrypt information.
      attribute :public_key_hash, :publicKeyHash, :String
      # Ephemeral Key A unique generated key used by Apple to encrypt data.
      attribute :ephemeral_key, :ephemeralKey, :String
      attribute :three_d_secure, :threeDSecure, :MobilePaymentThreeDSecure
      attribute :payment_product302_specific_input, :paymentProduct302SpecificInput, :PaymentProduct302SpecificInput
      attribute :payment_product5002_specific_input, :paymentProduct5002SpecificInput, :PaymentProduct5002SpecificInput
    end
  end
end
