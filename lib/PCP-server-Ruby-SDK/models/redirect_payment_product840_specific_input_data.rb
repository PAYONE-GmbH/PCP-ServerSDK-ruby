require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectPaymentProduct840SpecificInputData < ModelBase
      attribute :address_selection_at_pay_pal, :addressSelectionAtPayPal, :Boolean
      attribute :java_script_sdk_flow, :javaScriptSdkFlow, :Boolean
    end
  end
end
