require_relative 'model_base'

module PCPServerSDK
  module Models
    class RefreshPaymentRequest < ModelBase
      attribute :refresh_type, :refreshType, :RefreshType
    end
  end
end
