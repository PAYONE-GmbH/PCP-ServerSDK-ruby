require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompanyInformation < ModelBase
      # Name of company from a customer perspective
      attribute :name, :name, :String
    end
  end
end
