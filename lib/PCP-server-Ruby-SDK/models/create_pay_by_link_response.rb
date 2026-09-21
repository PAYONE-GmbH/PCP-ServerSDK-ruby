require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreatePayByLinkResponse < ModelBase
      attribute :expiration_date, :expirationDate, :Time
      attribute :payment_link_order, :paymentLinkOrder, :PaymentLinkOrder
      attribute :status, :status, :PayLinkStatusValue
      attribute :redirection_url, :redirectionUrl, :String
      attribute :payment_link_id, :paymentLinkId, :String
    end
  end
end
