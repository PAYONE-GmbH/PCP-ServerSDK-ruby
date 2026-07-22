require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemOrderStatus < ModelBase
      attribute :cart_item_status, :cartItemStatus, :CartItemStatus
      # Amount of units for which this status is applicable, should be greater than zero
      attribute :quantity, :quantity, :Integer
    end
  end
end
