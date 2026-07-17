require_relative 'model_base'

module PCPServerSDK
  module Models
    class ThreeDSecureResults < ModelBase
      # 3D Secure Protocol version used during this transaction.
      attribute :version, :version, :String
      # 3D Secure ECI (Electronic Commerce Indicator) depending on the Scheme. Returned by DS.
      attribute :scheme_eci, :schemeEci, :String
      # Exemption requested and applied in the authorization.
      attribute :applied_exemption, :appliedExemption, :String, enum: ["low-value", "merchant-acquirer-transaction-risk-analysis"]
    end
  end
end
