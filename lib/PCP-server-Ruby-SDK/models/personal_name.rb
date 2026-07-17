require_relative 'model_base'

module PCPServerSDK
  module Models
    class PersonalName < ModelBase
      # Given name(s) or first name(s) of the customer
      attribute :first_name, :firstName, :String
      # Surname(s) or last name(s) of the customer
      attribute :surname, :surname, :String
      # Title of customer
      attribute :title, :title, :String
    end
  end
end
