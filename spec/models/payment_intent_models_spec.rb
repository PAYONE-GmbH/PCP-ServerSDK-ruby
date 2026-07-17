require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe 'Payment intent models' do
  it 'deserializes and serializes nested payment intent data' do
    request = PCPServerSDK::Models::CreatePaymentIntentRequest.build_from_hash(
      'amountOfMoney' => { 'amount' => 1200, 'currencyCode' => 'EUR' },
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
    expect(request.shopping_cart.items.first).to be_a(PCPServerSDK::Models::CartItemData)
    expect(request.payment_method_specific_input.redirect_payment_method_specific_input.requires_approval).to be(false)
    expect(request.to_hash.dig(:shoppingCart, :items, 0, :invoiceData, :description)).to eq('Subscription')
  end
end
