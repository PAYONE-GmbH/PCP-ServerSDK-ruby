require_relative 'model_base'

module PCPServerSDK
  module Models
    class CheckoutReferences < ModelBase
      # Unique reference of the Checkout that is also returned for reporting and reconciliation purposes.
      attribute :merchant_reference, :merchantReference, :String
      # Optional parameter to define the shop or touchpoint where a sale has been realized (e.g. different stores).
      attribute :merchant_shop_reference, :merchantShopReference, :String
    end
  end
end
