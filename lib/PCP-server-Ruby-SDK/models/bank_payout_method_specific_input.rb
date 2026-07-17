require_relative 'model_base'

module PCPServerSDK
  module Models
    class BankPayoutMethodSpecificInput < ModelBase
      # Payment product identifier - please check product documentation for a full overview of possible values.
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product772_specific_input, :paymentProduct772SpecificInput, :SepaTransferPaymentProduct772SpecificInput
    end
  end
end
