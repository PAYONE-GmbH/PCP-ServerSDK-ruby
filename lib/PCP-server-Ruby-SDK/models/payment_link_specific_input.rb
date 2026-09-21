require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentLinkSpecificInput < ModelBase
      attribute :expiration_date, :expirationDate, :Time
      attribute :authorization_mode, :authorizationMode, :AuthorizationMode
      attribute :payment_methods, :paymentMethods, 'Array<String>'
      attribute :bnpl_id, :bnplId, :String
      attribute :return_url, :returnUrl, :String
      attribute :logo_url, :logoUrl, :String
      attribute :auto_redirection, :autoRedirection, :Boolean
      attribute :terms_url, :termsUrl, :String
      attribute :retry_number, :retryNumber, :Integer
      attribute :merchant_name, :merchantName, :String
      attribute :merchant_origin, :merchantOrigin, :String
    end
  end
end
