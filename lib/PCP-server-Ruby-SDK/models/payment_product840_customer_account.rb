require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the details of the PayPal account.
    class PaymentProduct840CustomerAccount < PCPServerSDK::ApiModel
      # Name of the company in case the PayPal account is owned by a business
      # @return [String, nil]
      attr_accessor :company_name

      # First name of the PayPal account holder
      # @return [String, nil]
      attr_accessor :first_name

      # The unique identifier of a PayPal account and will never change in the life cycle of a PayPal account.
      # @return [String, nil]
      attr_accessor :payer_id

      # Surname of the PayPal account holder
      # @return [String, nil]
      attr_accessor :surname

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            company_name == o.company_name &&
            first_name == o.first_name &&
            payer_id == o.payer_id &&
            surname == o.surname
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [company_name, first_name, payer_id, surname].hash
      end

      def to_hash
        hash = {}
        hash['companyName'] = @company_name unless @company_name.nil?
        hash['firstName'] = @first_name unless @first_name.nil?
        hash['payerId'] = @payer_id unless @payer_id.nil?
        hash['surname'] = @surname unless @surname.nil?
        hash
      end

      def from_hash(hash)
        @company_name = hash['companyName'] if hash.key? 'companyName'
        @first_name = hash['firstName'] if hash.key? 'firstName'
        @payer_id = hash['payerId'] if hash.key? 'payerId'
        @surname = hash['surname'] if hash.key? 'surname'
      end
    end
  end
end
