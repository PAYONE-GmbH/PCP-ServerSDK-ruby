require_relative 'model_base'

module PCPServerSDK
  module Models
    class DeliveryInformation < ModelBase
      # Items delivered.
      attribute :items, :items, "Array<CartItemInput>"
    end
  end
end
