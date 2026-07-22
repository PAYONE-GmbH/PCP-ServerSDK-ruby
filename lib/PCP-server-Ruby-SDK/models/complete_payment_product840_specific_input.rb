require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompletePaymentProduct840SpecificInput < ModelBase
      # Indicates whether the PayPal JavaScript SDK flow is used.
      # * true = The PayPal JavaScript SDK flow is used.
      # * false = The PayPal JavaScript SDK flow is not used.
      # Default value is false.
      attribute :java_script_sdk_flow, :javaScriptSdkFlow, :Boolean, default: false
      # Confirmation of the order status in case of PayPal SDK integration.
      attribute :action, :action, :String, enum: ["CONFIRM_ORDER_STATUS"]
    end
  end
end
