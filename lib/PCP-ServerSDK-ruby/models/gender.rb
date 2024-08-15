require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class Gender < PCPServerSDK::ApiEnum
      MALE = 'MALE'
      FEMALE = 'FEMALE'
      UNKNOWN = 'UNKNOWN'
    end
  end
end
