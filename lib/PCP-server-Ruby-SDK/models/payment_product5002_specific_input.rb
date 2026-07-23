require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct5002SpecificInput < ModelBase
      attribute :network, :network, :MobilePaymentNetwork
      # JWS Token Value (checkoutResponseSignature) as received in the Checkout Response on Client Side, Base64URL encoded.
      attribute :payment_checkout_data, :paymentCheckoutData, :String
      # DPA Identifier provided by PAYONE during client side initialization for the corresponding card type selected by the end consumer in the Click to Pay flow.
      attribute :src_dpa_id, :srcDpaId, :String
    end
  end
end
