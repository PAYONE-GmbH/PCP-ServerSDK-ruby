require_relative 'model_base'

module PCPServerSDK
  module Models
    class ShoppingCartPatch < ModelBase
      attribute :items, :items, "Array<CartItemPatch>"
    end
  end
end
