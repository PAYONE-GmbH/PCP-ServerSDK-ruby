require_relative 'model_base'

module PCPServerSDK
  module Models
    class ReturnInformation < ModelBase
      # Reason of the Refund (e.g. communicated by or to the consumer).
      attribute :return_reason, :returnReason, :String
      # Items returned.
      attribute :items, :items, "Array<CartItemInput>"
    end
  end
end
