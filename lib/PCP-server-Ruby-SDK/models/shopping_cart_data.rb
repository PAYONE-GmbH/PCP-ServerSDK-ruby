require_relative 'model_base'

module PCPServerSDK
  module Models
    class ShoppingCartData < ModelBase
      attribute :items, :items, :'Array<CartItemData>'
    end
  end
end
