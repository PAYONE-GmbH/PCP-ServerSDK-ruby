require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe 'Payment intent models' do
  it 'deserializes and serializes nested payment intent data' do
    request = PCPServerSDK::Models::CreatePaymentIntentRequest.build_from_hash(
      'amountOfMoney' => { 'amount' => 1200, 'currencyCode' => 'EUR' },
      'references' => { 'merchantReference' => 'subscription-123' },
      'shoppingCart' => {
        'items' => [{ 'invoiceData' => { 'description' => 'Subscription' } }]
      },
      'paymentMethodSpecificInput' => {
        'redirectPaymentMethodSpecificInput' => {
          'requiresApproval' => false,
          'paymentProductId' => 840,
          'paymentProduct840SpecificInput' => { 'javaScriptSdkFlow' => true }
        }
      }
    )

    expect(request.amount_of_money).to be_a(PCPServerSDK::Models::AmountOfMoney)
    expect(request.references).to be_a(PCPServerSDK::Models::PaymentReferencesForPaymentIntent)
    expect(request.shopping_cart.items.first).to be_a(PCPServerSDK::Models::CartItemData)
    expect(request.payment_method_specific_input.redirect_payment_method_specific_input.requires_approval).to be(false)
    expect(request.to_hash.dig(:shoppingCart, :items, 0, :invoiceData, :description)).to eq('Subscription')
  end

  it 'uses the payment-intent PayPal account structure' do
    response = PCPServerSDK::Models::PaymentIntentResponse.build_from_hash(
      'redirectPaymentMethodSpecificOutput' => {
        'paymentProduct840SpecificOutput' => {
          'customerAccount' => { 'emailAddress' => 'customer@example.com' }
        }
      }
    )

    customer_account = response.redirect_payment_method_specific_output.payment_product840_specific_output.customer_account

    expect(customer_account).to be_a(PCPServerSDK::Models::PaymentProduct840CustomerAccountForIntent)
    expect(customer_account.email_address).to eq('customer@example.com')
  end

  it 'uses the regular PayPal account structure outside payment intents' do
    output = PCPServerSDK::Models::PaymentProduct840SpecificOutput.build_from_hash(
      'customerAccount' => { 'payerId' => 'payer-123' }
    )

    expect(output.customer_account).to be_a(PCPServerSDK::Models::PaymentProduct840CustomerAccount)
    expect(output.customer_account.payer_id).to eq('payer-123')
  end
end
