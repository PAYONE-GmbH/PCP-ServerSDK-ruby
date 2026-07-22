require_relative 'model_base'

module PCPServerSDK
  module Models
    class OrderItem < ModelBase
      # Id of the item from the ShoppingCart. The id will be returned in the response from create Checkout request.
      attribute :id, :id, :String
      # Quantity of the specific item. Must be greater than zero.
      # Note: Must not be all spaces or all zeros
      attribute :quantity, :quantity, :Integer
    end
  end
end
