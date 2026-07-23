require_relative 'model_base'

module PCPServerSDK
  module Models
    class PatchCommerceCaseRequest < ModelBase
      attribute :customer, :customer, :Customer
    end
  end
end
