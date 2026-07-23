require_relative 'model_base'

module PCPServerSDK
  module Models
    class AddressPersonal < ModelBase
      # Second line of street or additional address information such as apartments and suits
      attribute :additional_info, :additionalInfo, :String
      # City
      attribute :city, :city, :String
      # ISO 3166-1 alpha-2 country code
      attribute :country_code, :countryCode, :String
      # House number
      attribute :house_number, :houseNumber, :String
      # State (ISO 3166-2 subdivisions), only if country=US, CA, CN, JP, MX, BR, AR, ID, TH, IN.
      attribute :state, :state, :String
      # Street name
      attribute :street, :street, :String
      # Zip code
      attribute :zip, :zip, :String
      attribute :name, :name, :PersonalName
    end
  end
end
