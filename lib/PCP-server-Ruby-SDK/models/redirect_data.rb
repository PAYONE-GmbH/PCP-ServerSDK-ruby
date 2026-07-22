require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectData < ModelBase
      # The URL that the customer should be redirected to. Be sure to redirect using the GET method
      attribute :redirect_url, :redirectURL, :String
    end
  end
end
