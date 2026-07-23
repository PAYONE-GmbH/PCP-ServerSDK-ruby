require_relative 'model_base'

module PCPServerSDK
  module Models
    class RefundErrorResponse < ModelBase
      # Unique reference, for debugging purposes, of this error response
      attribute :error_id, :errorId, :String
      attribute :errors, :errors, "Array<APIError>"
    end
  end
end
