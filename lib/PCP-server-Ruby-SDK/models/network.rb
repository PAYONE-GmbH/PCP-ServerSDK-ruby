require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class Network < PCPServerSDK::ApiEnum
      MASTERCARD = 'MASTERCARD'
      VISA = 'VISA'
      AMEX = 'AMEX'
      GIROCARD = 'GIROCARD'
      DISCOVER = 'DISCOVER'
      JCB = 'JCB'
    end
  end
end
