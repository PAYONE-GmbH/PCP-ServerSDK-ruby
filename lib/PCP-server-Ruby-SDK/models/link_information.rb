require_relative 'model_base'

module PCPServerSDK
  module Models
    class LinkInformation < ModelBase
      # URL of link.
      attribute :href, :href, :String
      # Content type of linked data.
      attribute :type, :type, :String
    end
  end
end
