require_relative 'model_base'

module PCPServerSDK
  module Models
    class ShippingAddress < AddressPersonal
      attr_accessor :company_name

      def self.attribute_map
        super.merge(company_name: :companyName)
      end

      def self.openapi_types
        super.merge(company_name: :String)
      end

      def self.openapi_all_of
        [:AddressPersonal]
      end

      def initialize(attributes = {})
        attributes = attributes.transform_keys(&:to_sym) if attributes.is_a?(Hash)
        super
        self.company_name = attributes[:'company_name'] if attributes.key?(:'company_name')
      end
    end
  end
end
