require_relative 'model_base'

module PCPServerSDK
  module Models
    class CardInfo < ModelBase
      # The card holder's name on the card.
      attribute :cardholder_name, :cardholderName, :String
    end
  end
end
