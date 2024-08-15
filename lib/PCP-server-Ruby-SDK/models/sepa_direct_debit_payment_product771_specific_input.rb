require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing information specific to SEPA Direct Debit
    class SepaDirectDebitPaymentProduct771SpecificInput < PCPServerSDK::ApiModel
      # The unique reference of the existing mandate to use in this payment.
      # @return [String, nil]
      attr_accessor :existing_unique_mandate_reference

      # @return [String, nil]
      attr_accessor :mandate

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            existing_unique_mandate_reference == o.existing_unique_mandate_reference &&
            mandate == o.mandate
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [existing_unique_mandate_reference, mandate].hash
      end

      def to_hash
        hash = {}
        hash['existingUniqueMandateReference'] = @existing_unique_mandate_reference unless @existing_unique_mandate_reference.nil?
        hash['mandate'] = @mandate.to_hash unless @mandate.nil?
        hash
      end

      def from_hash(hash)
        @existing_unique_mandate_reference = hash['existingUniqueMandateReference'] if hash.key? 'existingUniqueMandateReference'
        if hash.key? 'mandate'
          @mandate = ProcessingMandateInformation.new_from_hash(hash['mandate'])
        end
      end
    end
  end
end
