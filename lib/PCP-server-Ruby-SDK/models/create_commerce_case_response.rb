require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreateCommerceCaseResponse < ModelBase
      # Unique ID of the Commerce Case. It can used to add additional Checkouts to the Commerce Case.
      attribute :commerce_case_id, :commerceCaseId, :String
      # Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes.
      attribute :merchant_reference, :merchantReference, :String
      attribute :customer, :customer, :Customer
      attribute :checkout, :checkout, :CreateCheckoutResponse
      attribute :creation_date_time, :creationDateTime, :Time
    end
  end
end
