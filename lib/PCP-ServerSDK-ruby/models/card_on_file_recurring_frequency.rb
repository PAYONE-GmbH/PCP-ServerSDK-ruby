require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class CardOnFileRecurringFrequency < PCPServerSDK::ApiEnum
      YEARLY = "Yearly".freeze
      QUARTERLY = "Quarterly".freeze
      MONTHLY = "Monthly".freeze
      WEEKLY = "Weekly".freeze
      DAILY = "Daily".freeze
    end
  end
end
