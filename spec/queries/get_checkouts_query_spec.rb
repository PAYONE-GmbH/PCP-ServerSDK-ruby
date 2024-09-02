require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe PCPServerSDK::Queries::GetCheckoutsQuery do
  before(:each) do
    @query = PCPServerSDK::Queries::GetCheckoutsQuery.new
  end

  it 'should do something' do
    query = PCPServerSDK::Queries::GetCheckoutsQuery.new
    expect(query.instance_variable_get(:@include_payment_product_id)).to eq([])
  end

  it 'should initialize with default include_payment_product_id' do
    expect(@query.instance_variable_get(:@include_payment_product_id)).to eq([])
  end

  it 'should initialize with default include_checkout_status' do
    expect(@query.instance_variable_get(:@include_checkout_status)).to eq([])
  end

  it 'should initialize with default include_extended_checkout_status' do
    expect(@query.instance_variable_get(:@include_extended_checkout_status)).to eq([])
  end

  it 'should initialize with default include_payment_channel' do
    expect(@query.instance_variable_get(:@include_payment_channel)).to eq([])
  end

  it 'should return query map with offset' do
    @query.offset = 10
    expect(@query.to_query_map).to eq({ 'offset' => '10' })
  end

  it 'should return query map with size' do
    @query.size = 20
    expect(@query.to_query_map).to eq({ 'size' => '20' })
  end

  it 'should return query map with from_date' do
    @query.from_date = '2023-01-01'
    expect(@query.to_query_map).to eq({ 'fromDate' => '2023-01-01' })
  end

  it 'should return query map with to_date' do
    @query.to_date = '2023-12-31'
    expect(@query.to_query_map).to eq({ 'toDate' => '2023-12-31' })
  end

  it 'should return query map with from_checkout_amount' do
    @query.from_checkout_amount = 100
    expect(@query.to_query_map).to eq({ 'fromCheckoutAmount' => '100' })
  end

  it 'should return query map with to_checkout_amount' do
    @query.to_checkout_amount = 200
    expect(@query.to_query_map).to eq({ 'toCheckoutAmount' => '200' })
  end

  it 'should return query map with from_open_amount' do
    @query.from_open_amount = 50
    expect(@query.to_query_map).to eq({ 'fromOpenAmount' => '50' })
  end

  it 'should return query map with to_open_amount' do
    @query.to_open_amount = 150
    expect(@query.to_query_map).to eq({ 'toOpenAmount' => '150' })
  end

  it 'should return query map with from_collected_amount' do
    @query.from_collected_amount = 300
    expect(@query.to_query_map).to eq({ 'fromCollectedAmount' => '300' })
  end

  it 'should return query map with to_collected_amount' do
    @query.to_collected_amount = 500
    expect(@query.to_query_map).to eq({ 'toCollectedAmount' => '500' })
  end

  it 'should return query map with from_cancelled_amount' do
    @query.from_cancelled_amount = 50
    expect(@query.to_query_map).to eq({ 'fromCancelledAmount' => '50' })
  end

  it 'should return query map with to_cancelled_amount' do
    @query.to_cancelled_amount = 100
    expect(@query.to_query_map).to eq({ 'toCancelledAmount' => '100' })
  end

  it 'should return query map with from_refund_amount' do
    @query.from_refund_amount = 0
    expect(@query.to_query_map).to eq({ 'fromRefundAmount' => '0' })
  end

  it 'should return query map with to_refund_amount' do
    @query.to_refund_amount = 50
    expect(@query.to_query_map).to eq({ 'toRefundAmount' => '50' })
  end

  it 'should return query map with from_chargeback_amount' do
    @query.from_chargeback_amount = 0
    expect(@query.to_query_map).to eq({ 'fromChargebackAmount' => '0' })
  end

  it 'should return query map with to_chargeback_amount' do
    @query.to_chargeback_amount = 100
    expect(@query.to_query_map).to eq({ 'toChargebackAmount' => '100' })
  end

  it 'should return query map with checkout_id' do
    @query.checkout_id = 'checkout123'
    expect(@query.to_query_map).to eq({ 'checkoutId' => 'checkout123' })
  end

  it 'should return query map with merchant_reference' do
    @query.merchant_reference = 'ref123'
    expect(@query.to_query_map).to eq({ 'merchantReference' => 'ref123' })
  end

  it 'should return query map with merchant_customer_id' do
    @query.merchant_customer_id = 'customer123'
    expect(@query.to_query_map).to eq({ 'merchantCustomerId' => 'customer123' })
  end

  it 'should return query map with include_payment_product_id' do
    @query.include_payment_product_id = ['product1', 'product2']
    expect(@query.to_query_map).to eq({ 'includePaymentProductId' => 'product1,product2' })
  end

  it 'should return query map with include_checkout_status' do
    @query.include_checkout_status = ['status1', 'status2']
    expect(@query.to_query_map).to eq({ 'includeCheckoutStatus' => 'status1,status2' })
  end

  it 'should return query map with include_extended_checkout_status' do
    @query.include_extended_checkout_status = ['extended_status1', 'extended_status2']
    expect(@query.to_query_map).to eq({ 'includeExtendedCheckoutStatus' => 'extended_status1,extended_status2' })
  end

  it 'should return query map with include_payment_channel' do
    @query.include_payment_channel = ['channel1', 'channel2']
    expect(@query.to_query_map).to eq({ 'includePaymentChannel' => 'channel1,channel2' })
  end

  it 'should return query map with payment_reference' do
    @query.payment_reference = 'payment123'
    expect(@query.to_query_map).to eq({ 'paymentReference' => 'payment123' })
  end

  it 'should return query map with payment_id' do
    @query.payment_id = 'payment456'
    expect(@query.to_query_map).to eq({ 'paymentId' => 'payment456' })
  end

  it 'should return query map with first_name' do
    @query.first_name = 'John'
    expect(@query.to_query_map).to eq({ 'firstName' => 'John' })
  end

  it 'should return query map with surname' do
    @query.surname = 'Doe'
    expect(@query.to_query_map).to eq({ 'surname' => 'Doe' })
  end

  it 'should return query map with email' do
    @query.email = 'john.doe@example.com'
    expect(@query.to_query_map).to eq({ 'email' => 'john.doe@example.com' })
  end

  it 'should return query map with phone_number' do
    @query.phone_number = '1234567890'
    expect(@query.to_query_map).to eq({ 'phoneNumber' => '1234567890' })
  end

  it 'should return query map with date_of_birth' do
    @query.date_of_birth = '1990-01-01'
    expect(@query.to_query_map).to eq({ 'dateOfBirth' => '1990-01-01' })
  end

  it 'should return query map with company_information' do
    @query.company_information = 'Company XYZ'
    expect(@query.to_query_map).to eq({ 'companyInformation' => 'Company XYZ' })
  end
end
