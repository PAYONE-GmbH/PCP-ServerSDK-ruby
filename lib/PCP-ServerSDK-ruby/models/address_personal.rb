require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing personal or shipping address information.
    class AddressPersonal < PCPServerSDK::ApiModel
      # Second line of street or additional address information such as apartments and suits
      # @return [String, nil]
      attr_accessor :additional_info

      # City
      # @return [String, nil]
      attr_accessor :city

      # ISO 3166-1 alpha-2 country code
      # @return [String, nil]
      attr_accessor :country_code

      # House number
      # @return [String, nil]
      attr_accessor :house_number

      # State (ISO 3166-2 subdivisions), only if country=US, CA, CN, JP, MX, BR, AR, ID, TH, IN.
      # @return [String, nil] state
      attr_accessor :state

      # Street name
      # @return [String, nil]
      attr_accessor :street

      # Zip code
      # @return [String, nil]
      attr_accessor :zip

      # @return [PCPServerSDK::Models::PersonalName, nil]
      attr_accessor :name

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            additional_info == o.additional_info &&
            city == o.city &&
            country_code == o.country_code &&
            house_number == o.house_number &&
            state == o.state &&
            street == o.street &&
            zip == o.zip &&
            name == o.name
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [additional_info, city, country_code, house_number, state, street, zip, name].hash
      end

      def to_hash
        hash['additionalInfo'] = @additional_info unless @additional_info.nil?
        hash['city'] = @city unless @city.nil?
        hash['countryCode'] = @country_code unless @country_code.nil?
        hash['houseNumber'] = @house_number unless @house_number.nil?
        hash['name'] = @name.to_hash if @name.nil?
        hash['state'] = @state unless @state.nil?
        hash['street'] = @street unless @street.nil?
        hash['zip'] = @zip unless @zip.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @additional_info = hash['additionalInfo'] if hash.key? 'additionalInfo'
        @city = hash['city'] if hash.key? 'city'
        @country_code = hash['countryCode'] if hash.key? 'countryCode'
        @house_number = hash['houseNumber'] if hash.key? 'houseNumber'
        if hash.key? 'name'
          @name = PCPServerSDK::Models::PersonalName.new_from_hash(hash['name'])
        end
        @state = hash['state'] if hash.key? 'state'
        @street = hash['street'] if hash.key? 'street'
        @zip = hash['zip'] if hash.key? 'zip'
      end
    end
  end
end
