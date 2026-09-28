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

  it 'serializes the patch request with the updated amount and shopping cart' do
    request = PCPServerSDK::Models::PatchPaymentIntentRequest.build_from_hash(
      'amountOfMoney' => { 'amount' => 1500, 'currencyCode' => 'EUR' },
      'shoppingCart' => { 'items' => [{ 'invoiceData' => { 'description' => 'Updated item' } }] }
    )

    expect(request.amount_of_money).to be_a(PCPServerSDK::Models::AmountOfMoney)
    expect(request.shopping_cart.items.first).to be_a(PCPServerSDK::Models::CartItemData)
    expect(request.to_hash).to eq(
      amountOfMoney: { amount: 1500, currencyCode: 'EUR' },
      shoppingCart: { items: [{ invoiceData: { description: 'Updated item' } }] }
    )
  end

  it 'deserializes the patch response using the create response structure' do
    response = PCPServerSDK::Models::PatchPaymentIntentResponse.build_from_hash(
      'paymentIntentOutput' => { 'paymentIntentId' => 'intent-1' },
      'shoppingCart' => { 'items' => [] }
    )

    expect(response).to be_a(PCPServerSDK::Models::CreatePaymentIntentResponse)
    expect(response.payment_intent_output.payment_intent_id).to eq('intent-1')
    expect(response.shopping_cart).to be_a(PCPServerSDK::Models::ShoppingCartData)
    expect(response.to_hash.dig(:paymentIntentOutput, :paymentIntentId)).to eq('intent-1')
  end

  it 'uses redirectData in created payment intent output' do
    response = PCPServerSDK::Models::CreatePaymentIntentResponse.build_from_hash(
      'paymentIntentOutput' => {
        'redirectPaymentMethodSpecificOutput' => {
          'redirectData' => { 'redirectURL' => 'https://example.com/redirect' }
        }
      }
    )
    redirect_output = response.payment_intent_output.redirect_payment_method_specific_output

    expect(redirect_output.redirect_data).to be_a(PCPServerSDK::Models::RedirectData)
    expect(redirect_output.redirect_data.redirect_url).to eq('https://example.com/redirect')
    expect(response.to_hash.dig(:paymentIntentOutput, :redirectPaymentMethodSpecificOutput, :redirectData))
      .to eq(redirectURL: 'https://example.com/redirect')
  end
end
