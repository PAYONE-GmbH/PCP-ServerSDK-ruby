require_relative 'model_base'

module PCPServerSDK
  module Models
    class APIError < ModelBase
      # Error code
      attribute :error_code, :errorCode, :String
      # Category the error belongs to. The category should give an indication of the type of error you are dealing
      # with. Do not expect a finite set of possible categories, as they are subject to change. Common values are:
      # * DIRECT_PLATFORM_ERROR - indicating that a functional error has occurred in the platform.
      # * PAYMENT_PLATFORM_ERROR - indicating that a functional error has occurred in the payment platform.
      # * IO_ERROR - indicating that a technical error has occurred within the payment platform or between the
      # payment platform and third party systems.
      # * COMMERCE_PLATFORM_ERROR - indicating an error originating from the Commerce Platform.
      # * COMMERCE_PORTAL_BACKEND_ERROR - indicating an error originating from the Commerce Portal Backend.
      attribute :category, :category, :String
      # HTTP status code for this error that can be used to determine the type of error
      attribute :http_status_code, :httpStatusCode, :Integer
      # ID of the error. This is a short human-readable message that briefly describes the error.
      attribute :id, :id, :String
      # Human-readable error message that is not meant to be relayed to customer as it might tip off people who are
      # trying to commit fraud
      attribute :message, :message, :String
      # Returned only if the error relates to a value that was missing or incorrect.
      #
      # Contains a location path to the value as a JSonata query.
      #
      # Some common examples:
      # * a.b selects the value of property b of root property a,
      # * a[1] selects the first element of the array in root property a,
      # * a[b='some value'] selects all elements of the array in root property a that have a property b with value
      # 'some value'.
      attribute :property_name, :propertyName, :String
    end
  end
end
