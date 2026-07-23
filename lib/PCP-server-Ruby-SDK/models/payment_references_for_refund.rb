require_relative 'payment_references'

module PCPServerSDK
  module Models
    class PaymentReferencesForRefund < PaymentReferences
      # Merchant-provided reference of the capture that this refund should be applied to.
      # A single Checkout can contain multiple partial captures.
      # By supplying the captureReference the merchant ensures the refund is allocated to the correct
      # capture.
      #
      # This value must match the merchantReference that was provided in the PaymentReferences of the
      # original capture request.
      attribute :capture_reference, :captureReference, :String

      def self.openapi_all_of
        [:PaymentReferences]
      end
    end
  end
end
