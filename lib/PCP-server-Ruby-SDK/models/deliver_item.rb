require_relative 'model_base'

module PCPServerSDK
  module Models
    class DeliverItem < ModelBase
      # Id of the item to deliver.
      attribute :id, :id, :String
      # Quantity of the units being delivered, should be greater than zero
      # Note: Must not be all spaces or all zeros
      attribute :quantity, :quantity, :Integer
    end
  end
end
