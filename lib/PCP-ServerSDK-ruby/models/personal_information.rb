require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing personal information like name, date of birth and gender.
    class PersonalInformation < PCPServerSDK::ApiModel
      # The date of birth of the customer of the recipient of the loan. Format YYYYMMDD
      # @return [String, nil]
      attr_accessor :date_of_birth

      # The gender of the customer.
      # Should be one of the string constants provided by {PCPServerSDK::Models::Gender}
      # possible values are:
      # - MALE
      # - FEMALE
      # - UNKNOWN
      # @return [String, nil]
      attr_accessor :gender

      # @return [PCPServerSDK::Models::PersonalName, nil]
      attr_accessor :name

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            date_of_birth == o.date_of_birth &&
            gender == o.gender &&
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
        [date_of_birth, gender, name].hash
      end

      def to_hash
        hash = {}
        hash['dateOfBirth'] = @date_of_birth unless @date_of_birth.nil?
        hash['gender'] = @gender unless @gender.nil?
        hash['name'] = @name.to_hash unless @name.nil?
        hash
      end


      # @param hash [Hash]
      def from_hash(hash)
        @date_of_birth = hash['dateOfBirth'] if hash.key? 'dateOfBirth'
        if hash.key? 'gender'
          @gender = Gender.validate(hash['gender'])
        end
        if hash.key? 'name'
          @name = PersonalName.new_from_hash(hash['name'])
        end
      end
    end
  end
end
