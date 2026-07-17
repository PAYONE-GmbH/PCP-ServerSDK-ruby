require_relative 'model_base'

module PCPServerSDK
  module Models
    class CheckoutsResponse < ModelBase
      # Number of found Checkouts
      attribute :number_of_checkouts, :numberOfCheckouts, :Integer
      # List of Checkouts
      attribute :checkouts, :checkouts, "Array<CheckoutResponse>"
    end
  end
end
