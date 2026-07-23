require_relative 'model_base'

module PCPServerSDK
  module Models
    class ShoppingCartResult < ModelBase
      attribute :items, :items, "Array<CartItemResult>"
    end
  end
end
