require_relative 'model_base'

module PCPServerSDK
  module Models
    class Shipping < ModelBase
      attribute :address, :address, :AddressPersonal
    end
  end
end
