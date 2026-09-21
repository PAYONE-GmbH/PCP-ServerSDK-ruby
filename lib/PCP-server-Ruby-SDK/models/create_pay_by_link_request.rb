require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreatePayByLinkRequest < ModelBase
      attribute :payment_link_specific_input, :paymentLinkSpecificInput, :PaymentLinkSpecificInput
      attribute :order_type, :orderType, :OrderType
      attribute :items, :items, 'Array<OrderItem>'
      attribute :order_references, :orderReferences, :References
    end
  end
end
