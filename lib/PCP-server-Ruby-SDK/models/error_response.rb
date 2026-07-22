require_relative 'model_base'

module PCPServerSDK
  module Models
    class ErrorResponse < ModelBase
      # Unique reference of this error response for debugging purposes
      attribute :error_id, :errorId, :String
      attribute :errors, :errors, "Array<APIError>"
    end
  end
end
