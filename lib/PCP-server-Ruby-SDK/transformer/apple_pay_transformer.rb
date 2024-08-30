require_relative '../models/apple_payment_data_token_header_information'
require_relative '../models/apple_payment_data_token_information'
require_relative '../models/apple_payment_token_version'
require_relative '../models/applepay/apple_pay_payment'
require_relative '../models/applepay/apple_pay_payment_token'
require_relative '../models/applepay/apple_pay_payment_data'
require_relative '../models/applepay/apple_pay_payment_data_header'
require_relative '../models/applepay/apple_pay_payment_method'
require_relative '../models/mobile_payment_method_specific_input'
require_relative '../models/network'
require_relative '../models/payment_product320_specific_input'


# Transforms an ApplePayPayment to a MobilePaymentMethodSpecificInput
# @param [PCPServerSDK::Models::ApplePayPayment] payment
# @return [PCPServerSDK::Models::MobilePaymentMethodSpecificInput]
def transform_apple_pay_payment_to_mobile_payment_method_specific_input(payment)
  token = payment.token || PCPServerSDK::Models::ApplePayPaymentToken.new
  payment_data = token.payment_data || PCPServerSDK::Models::ApplePayPaymentData.new
  header = payment_data.header || PCPServerSDK::Models::ApplePayPaymentDataHeader.new
  payment_method = token.payment_method || PCPServerSDK::Models::ApplePayPaymentMethod.new

  PCPServerSDK::Models::MobilePaymentMethodSpecificInput.new(
    payment_product_id: 302,
    public_key_hash: header.public_key_hash,
    ephemeral_key: header.ephemeral_public_key,
    payment_product302_specific_input: PCPServerSDK::Models::PaymentProduct320SpecificInput.new(
      network: PCPServerSDK::Models::Network.from_string(payment_method.network.to_s),
      token: PCPServerSDK::Models::ApplePaymentDataTokenInformation.new(
        version: PCPServerSDK::Models::ApplePaymentTokenVersion.from_string(payment_data.version.to_s),
        signature: payment_data.signature,
        header: PCPServerSDK::Models::ApplePaymentDataTokenHeaderInformation.new(
          transaction_id: header.transaction_id,
          application_data: header.application_data
        )
      )
    )
  )
end
