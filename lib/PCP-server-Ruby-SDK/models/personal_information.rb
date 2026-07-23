require_relative 'model_base'

module PCPServerSDK
  module Models
    class PersonalInformation < ModelBase
      # The date of birth of the customer of the recipient of the loan.
      # Format YYYYMMDD
      attribute :date_of_birth, :dateOfBirth, :String
      # The gender of the customer, possible values are:
      # * MALE
      # * FEMALE
      # * UNKNOWN
      attribute :gender, :gender, :String, enum: ["MALE", "FEMALE", "UNKNOWN"]
      attribute :name, :name, :PersonalName
    end
  end
end
