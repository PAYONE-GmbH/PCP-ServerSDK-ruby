require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe 'Pay-by-link models' do
  it 'serializes required request properties and deserializes the response structure' do
    request = PCPServerSDK::Models::CreatePayByLinkRequest.new(
      payment_link_specific_input: PCPServerSDK::Models::PaymentLinkSpecificInput.new(
        authorization_mode: 'SALE',
        payment_methods: ['840'],
        return_url: 'https://merchant.example/complete'
      ),
      order_type: 'FULL',
      order_references: PCPServerSDK::Models::References.new(merchant_reference: 'order-123')
    )

    expect(request.to_hash).to include(
      paymentLinkSpecificInput: {
        authorizationMode: 'SALE',
        paymentMethods: ['840'],
        returnUrl: 'https://merchant.example/complete'
      },
      orderType: 'FULL',
      orderReferences: { merchantReference: 'order-123' }
    )

    response = PCPServerSDK::Models::CreatePayByLinkResponse.build_from_hash(
      'expirationDate' => '2026-09-22T12:00:00Z',
      'paymentLinkOrder' => {
        'merchantReference' => 'order-123',
        'amount' => { 'amount' => 1200, 'currencyCode' => 'EUR' }
      },
      'status' => 'ACTIVE',
      'redirectionUrl' => 'https://commerce.example/pay/link',
      'paymentLinkId' => '707ef15b-7a0a-48f2-b7d8-c95103418a9c'
    )

    expect(response.expiration_date).to be_a(Time)
    expect(response.payment_link_order).to be_a(PCPServerSDK::Models::PaymentLinkOrder)
    expect(response.payment_link_order.amount).to be_a(PCPServerSDK::Models::AmountOfMoney)
    expect(response.payment_link_order.amount.amount).to eq(1200)
    expect(response.payment_link_order.amount.currency_code).to eq('EUR')
    expect(response.status).to eq('ACTIVE')
  end

  it 'enforces the required request fields from the OpenAPI schema' do
    expect do
      PCPServerSDK::Models::CreatePayByLinkRequest.new(order_type: 'FULL')
    end.to raise_error(ArgumentError, 'payment_link_specific_input cannot be nil')
  end
end
