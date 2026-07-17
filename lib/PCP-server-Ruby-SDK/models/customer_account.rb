require_relative 'model_base'

module PCPServerSDK
  module Models
    class CustomerAccount < ModelBase
      attribute :create_date, :createDate, :Time
    end
  end
end
