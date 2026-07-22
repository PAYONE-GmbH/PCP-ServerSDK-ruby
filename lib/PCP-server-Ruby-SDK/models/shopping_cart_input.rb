require_relative 'model_base'

module PCPServerSDK
  module Models
    class ShoppingCartInput < ModelBase
      attribute :items, :items, "Array<CartItemInput>"
    end
  end
end
