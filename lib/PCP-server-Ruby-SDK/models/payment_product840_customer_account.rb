require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct840CustomerAccount < ModelBase
      # Name of the company in case the PayPal account is owned by a business
      attribute :company_name, :companyName, :String
      # First name of the PayPal account holder
      attribute :first_name, :firstName, :String
      # The unique identifier of a PayPal account and will never change in the life cycle of a PayPal account.
      attribute :payer_id, :payerId, :String
      # Surname of the PayPal account holder
      attribute :surname, :surname, :String
    end
  end
end
