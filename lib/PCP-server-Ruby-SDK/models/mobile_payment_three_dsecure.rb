require_relative 'model_base'

module PCPServerSDK
  module Models
    class MobilePaymentThreeDSecure < ModelBase
      attribute :redirection_data, :redirectionData, :RedirectionData
    end
  end
end
