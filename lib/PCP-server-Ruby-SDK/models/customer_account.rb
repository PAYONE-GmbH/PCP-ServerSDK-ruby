require_relative 'model_base'

module PCPServerSDK
  module Models
    class CustomerAccount < ModelBase
      # Creation date and time of the customer account in ISO 8601 format (UTC).
      # Accepted formats are:
      # * YYYY-MM-DD'T'HH:mm:ss'Z'
      # * YYYY-MM-DD'T'HH:mm:ss+XX:XX
      # * YYYY-MM-DD'T'HH:mm:ss-XX:XX
      # * YYYY-MM-DD'T'HH:mm'Z'
      # * YYYY-MM-DD'T'HH:mm+XX:XX
      # * YYYY-MM-DD'T'HH:mm-XX:XX
      attribute :create_date, :createDate, :Time
    end
  end
end
