require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectPaymentMethodSpecificOutputForCreateIntent < ModelBase
      attribute :requires_approval, :requiresApproval, :Boolean
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product840_specific_output, :paymentProduct840SpecificOutput, :RedirectPaymentProduct840SpecificInputData
      attribute :redirection_data, :redirectionData, :RedirectionData
    end
  end
end
