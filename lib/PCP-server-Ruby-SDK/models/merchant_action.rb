require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object that contains the action, including the needed data, that you should perform next, like showing instructions, showing the transaction results or redirect to a third party to complete the payment
    class MerchantAction < PCPServerSDK::ApiModel
      # Action merchants needs to take in the online payment process. Possible values are:   
      # - REDIRECT - The customer needs to be redirected using the details found in redirectData   
      # - SHOW_FORM - The customer needs to be shown a form with the fields found in formFields. You can submit the data entered by the user in a Complete payment request.   
      # - SHOW_INSTRUCTIONS - The customer needs to be shown payment instruction using the details found in showData. Alternatively the instructions can be rendered by us using the instructionsRenderingData   
      # - SHOW_TRANSACTION_RESULTS - The customer needs to be shown the transaction results using the details found in showData. Alternatively the instructions can be rendered by us using the instructionsRenderingData   
      # - MOBILE_THREEDS_CHALLENGE - The customer needs to complete a challenge as part of the 3D Secure authentication inside your mobile app. The details contained in mobileThreeDSecureChallengeParameters need to be provided to the EMVco certified Mobile SDK as a challengeParameters object.   
      # - CALL_THIRD_PARTY - The merchant needs to call a third party using the data found in thirdPartyData
      # @return [String, nil]
      attr_accessor :action_type

      # @return [PCPServerSDK::Models::RedirectData, nil]
      attr_accessor :redirect_data

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            action_type == o.action_type &&
            redirect_data == o.redirect_data
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [action_type, redirect_data].hash
      end

      def to_hash
        hash = {}
        hash['actionType'] = @action_type unless @action_type.nil?
        hash['redirectData'] = @redirect_data.to_hash unless @redirect_data.nil?
        hash
      end

      def from_hash(hash)
        @action_type = hash['actionType'] if hash.key? 'actionType'
        if hash.key? 'redirectData'
          @redirect_data = RedirectData.new_from_hash(hash['redirectData'])
        end
      end
    end
  end
end
