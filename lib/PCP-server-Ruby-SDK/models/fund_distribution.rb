require_relative 'model_base'

module PCPServerSDK
  module Models
    class FundDistribution < ModelBase
      attribute :id, :id, :String
      # Unique identifier of the beneficiary (seller/partner/sub-account) to receive funds (e.g., payout account ID).
      attribute :account_id, :accountId, :String
      # Human-readable description for reconciliation. Appears on reports.
      attribute :description, :description, :String
      # Amount in cents and always having 2 decimals, in the currency of the original transaction
      attribute :amount, :amount, :Integer
      # Classification or purpose of the fund distribution to the receiving account within a given order.
      attribute :type, :type, :String, enum: ["SELLER_REVENUE", "COMMISSION_FEE", "SHIPPING_COSTS", "TAX", "PLATFORM_FEE", "OTHER"]
      # Unique reference of the part of the fund/payment to be distributed that is also returned for reporting and reconciliation purposes.
      attribute :merchant_reference, :merchantReference, :String
      # It allows you to store additional parameters for the transaction in JSON format. This field must not contain any personal data.
      attribute :merchant_parameters, :merchantParameters, :String
    end
  end
end
