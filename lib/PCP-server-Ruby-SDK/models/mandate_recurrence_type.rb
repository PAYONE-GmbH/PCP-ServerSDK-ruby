require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class MandateRecurrenceType < PCPServerSDK::ApiEnum
      UNIQUE = "UNIQUE".freeze
      RECURRING = "RECURRING".freeze
    end
  end
end
