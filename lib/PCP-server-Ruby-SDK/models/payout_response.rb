require_relative 'model_base'

module PCPServerSDK
  module Models
    class PayoutResponse < ModelBase
      attribute :payout_output, :payoutOutput, :PayoutOutput
      attribute :status, :status, :StatusValue
      attribute :status_category, :statusCategory, :StatusCategoryValue
      # Unique payment transaction identifier of the payment gateway.
      attribute :id, :id, :String
    end
  end
end
