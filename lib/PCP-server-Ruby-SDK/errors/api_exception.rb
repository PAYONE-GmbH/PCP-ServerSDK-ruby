module PCPServerSDK
  module Errors
    

    class ApiException < StandardError
      attr_reader :status_code, :response_body

      # The constructor
      # @param [Integer] status_code
      # @param [String] response_body
      # @param [StandardError] cause
      def initialize(status_code, response_body, cause = nil)
        super(response_body)
        @status_code = status_code
        @response_body = response_body
        set_backtrace(cause.backtrace) if cause
      end

      def to_s
        message
      end

      def message
        if @message.nil?
          msg = "Error message: the server returns an error"
        else
          msg = @message
        end

        msg += "\nHTTP status code: #{status_code}" if status_code
        msg += "\nResponse body: #{response_body}" if response_body

        msg
      end
    end
  end
end
