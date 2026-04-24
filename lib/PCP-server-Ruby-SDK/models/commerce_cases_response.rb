require_relative 'commerce_case_response'

module PCPServerSDK
  module Models
    # Top-level response for listing Commerce Cases.
    class CommerceCasesResponse < Array
      def self.build_from_hash(attributes)
        return new unless attributes.is_a?(Array)

        new.concat(attributes.map { |item| PCPServerSDK::Models::CommerceCaseResponse.build_from_hash(item) })
      end

      def to_body
        map { |item| item.respond_to?(:to_body) ? item.to_body : item }
      end
    end
  end
end
