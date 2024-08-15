require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class DeliverType < PCPServerSDK::ApiEnum
      FULL = "FULL".freeze
      PARTIAL = "PARTIAL".freeze
    end
  end
end
