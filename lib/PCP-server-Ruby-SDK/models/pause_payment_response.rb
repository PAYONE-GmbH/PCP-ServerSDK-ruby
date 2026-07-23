require_relative 'model_base'

module PCPServerSDK
  module Models
    class PausePaymentResponse < ModelBase
      attribute :status, :status, :StatusValue
    end
  end
end
