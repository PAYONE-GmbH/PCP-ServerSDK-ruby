require_relative 'model_base'

module PCPServerSDK
  module Models
    class CancelItem < ModelBase
      # Id of the item to cancel.
      attribute :id, :id, :String
      # Quantity of the units being cancelled, should be greater than zero
      # Note: Must not be all spaces or all zeros
      attribute :quantity, :quantity, :Integer
    end
  end
end
