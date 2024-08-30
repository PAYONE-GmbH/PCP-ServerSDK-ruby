require 'rspec'
require_relative '../../lib/PCP-server-Ruby-SDK/models/apple_payment_data_token_header_information'
require_relative '../../lib/PCP-server-Ruby-SDK/models/apple_payment_data_token_information'
require_relative '../../lib/PCP-server-Ruby-SDK/models/apple_payment_token_version'
require_relative '../../lib/PCP-server-Ruby-SDK/models/applepay/apple_pay_payment'
require_relative '../../lib/PCP-server-Ruby-SDK/models/applepay/apple_pay_payment_token'
require_relative '../../lib/PCP-server-Ruby-SDK/models/applepay/apple_pay_payment_data'
require_relative '../../lib/PCP-server-Ruby-SDK/models/applepay/apple_pay_payment_data_header'
require_relative '../../lib/PCP-server-Ruby-SDK/models/applepay/apple_pay_payment_method'
require_relative '../../lib/PCP-server-Ruby-SDK/models/mobile_payment_method_specific_input'
require_relative '../../lib/PCP-server-Ruby-SDK/models/network'
require_relative '../../lib/PCP-server-Ruby-SDK/models/payment_product320_specific_input'
require_relative '../../lib/PCP-server-Ruby-SDK/transformer/apple_pay_transformer'

RSpec.describe 'transform_apple_pay_payment_to_mobile_payment_method_specific_input' do
  let(:header) do
    PCPServerSDK::Models::ApplePayPaymentDataHeader.new(
      public_key_hash: 'publicKeyHash123',
      ephemeral_public_key: 'ephemeralPublicKey123',
      transaction_id: 'transactionId123',
      application_data: 'applicationData123'
    )
  end

  let(:payment_data) do
    PCPServerSDK::Models::ApplePayPaymentData.new(
      version: 'EC_V1',
      signature: 'signature123',
      header: header
    )
  end

  let(:payment_method) do
    PCPServerSDK::Models::ApplePayPaymentMethod.new(
      network: 'VISA'
    )
  end

  let(:token) do
    PCPServerSDK::Models::ApplePayPaymentToken.new(
      payment_data: payment_data,
      payment_method: payment_method
    )
  end

  let(:payment) do
    PCPServerSDK::Models::ApplePayPayment.new(
      token
    )
  end

  it 'transforms ApplePayPayment to MobilePaymentMethodSpecificInput correctly' do
    result = transform_apple_pay_payment_to_mobile_payment_method_specific_input(payment)

    expected_result = PCPServerSDK::Models::MobilePaymentMethodSpecificInput.new(
      payment_product_id: 302,
      public_key_hash: 'publicKeyHash123',
      ephemeral_key: 'ephemeralPublicKey123',
      payment_product302_specific_input: PCPServerSDK::Models::PaymentProduct320SpecificInput.new(
        network: PCPServerSDK::Models::Network.from_string('VISA'),
        token: PCPServerSDK::Models::ApplePaymentDataTokenInformation.new(
          version: PCPServerSDK::Models::ApplePaymentTokenVersion.from_string('EC_V1'),
          signature: 'signature123',
          header: PCPServerSDK::Models::ApplePaymentDataTokenHeaderInformation.new(
            transaction_id: 'transactionId123',
            application_data: 'applicationData123'
          )
        )
      )
    )
    expect(result).to eq(expected_result)
  end

  it 'raises an error for unknown network' do
    payment.token.payment_method.network = 'UNKNOWN'
    expect { transform_apple_pay_payment_to_mobile_payment_method_specific_input(payment) }.to raise_error(TypeError)
  end

  it 'raises an error for unknown version' do
    payment.token.payment_data.version = 'UNKNOWN'
    expect { transform_apple_pay_payment_to_mobile_payment_method_specific_input(payment) }.to raise_error(TypeError)
  end
end
