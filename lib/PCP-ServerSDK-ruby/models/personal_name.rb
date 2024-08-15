require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the name details of the customer
    class PersonalName < PCPServerSDK::ApiModel
      # Given name(s) or first name(s) of the customer
      # @return [String, nil]
      attr_accessor :first_name

      # Surname(s) or last name(s) of the customer
      # @return [String, nil]
      attr_accessor :surname

      # Title of customer
      # @return [String, nil]
      attr_accessor :title

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            first_name == o.first_name &&
            surname == o.surname &&
            title == o.title
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [first_name, surname, title].hash
      end

      def to_hash
        hash = {}
        hash['firstName'] = @first_name unless @first_name.nil?
        hash['surname'] = @surname unless @surname.nil?
        hash['title'] = @title unless @title.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @first_name = hash['firstName'] if hash.key? 'firstName'
        @surname = hash['surname'] if hash.key? 'surname'
        @title = hash['title'] if hash.key? 'title'
      end
    end
  end
end
