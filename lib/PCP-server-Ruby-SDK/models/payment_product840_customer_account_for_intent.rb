require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct840CustomerAccountForIntent < ModelBase
      attribute :company_name, :companyName, :String
      attribute :first_name, :firstName, :String
      attribute :surname, :surname, :String
      attribute :email_address, :emailAddress, :String
    end
  end
end
