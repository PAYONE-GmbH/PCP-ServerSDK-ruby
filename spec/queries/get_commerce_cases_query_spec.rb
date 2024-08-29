require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/queries/get_commerce_cases_query'

RSpec.describe PCPServerSDK::Queries::GetCommerceCasesQuery do
  let(:query) { PCPServerSDK::Queries::GetCommerceCasesQuery.new }

  it 'sets default include_checkout_status' do
    expect(query.include_checkout_status).to eq([])
  end

  it 'sets default include_payment_channel' do
    expect(query.include_payment_channel).to eq([])
  end

  it 'sets offset' do
    query.set_offset(10)
    expect(query.offset).to eq(10)
  end

  it 'sets size' do
    query.set_size(20)
    expect(query.size).to eq(20)
  end

  it 'sets from_date' do
    query.set_from_date('2023-01-01')
    expect(query.from_date).to eq('2023-01-01')
  end

  it 'sets to_date' do
    query.set_to_date('2023-12-31')
    expect(query.to_date).to eq('2023-12-31')
  end

  it 'sets commerce_case_id' do
    query.set_commerce_case_id('case_123')
    expect(query.commerce_case_id).to eq('case_123')
  end

  it 'sets merchant_reference' do
    query.set_merchant_reference('ref_456')
    expect(query.merchant_reference).to eq('ref_456')
  end

  it 'sets merchant_customer_id' do
    query.set_merchant_customer_id('cust_789')
    expect(query.merchant_customer_id).to eq('cust_789')
  end

  it 'sets include_checkout_status' do
    query.set_include_checkout_status(['status1', 'status2'])
    expect(query.include_checkout_status).to eq(['status1', 'status2'])
  end

  it 'sets include_payment_channel' do
    query.set_include_payment_channel(['channel1', 'channel2'])
    expect(query.include_payment_channel).to eq(['channel1', 'channel2'])
  end

  it 'returns query map with offset' do
    query.set_offset(10)
    expect(query.to_query_map).to eq({ 'offset' => '10' })
  end

  it 'returns query map with size' do
    query.set_size(20)
    expect(query.to_query_map).to eq({ 'size' => '20' })
  end

  it 'returns query map with from_date' do
    query.set_from_date('2023-01-01')
    expect(query.to_query_map).to eq({ 'fromDate' => '2023-01-01' })
  end

  it 'returns query map with to_date' do
    query.set_to_date('2023-12-31')
    expect(query.to_query_map).to eq({ 'toDate' => '2023-12-31' })
  end

  it 'returns query map with commerce_case_id' do
    query.set_commerce_case_id('case_123')
    expect(query.to_query_map).to eq({ 'commerceCaseId' => 'case_123' })
  end

  it 'returns query map with merchant_reference' do
    query.set_merchant_reference('ref_456')
    expect(query.to_query_map).to eq({ 'merchantReference' => 'ref_456' })
  end

  it 'returns query map with merchant_customer_id' do
    query.set_merchant_customer_id('cust_789')
    expect(query.to_query_map).to eq({ 'merchantCustomerId' => 'cust_789' })
  end

  it 'returns query map with include_checkout_status' do
    query.set_include_checkout_status(['status1', 'status2'])
    expect(query.to_query_map).to eq({ 'includeCheckoutStatus' => 'status1,status2' })
  end

  it 'returns query map with include_payment_channel' do
    query.set_include_payment_channel(['channel1', 'channel2'])
    expect(query.to_query_map).to eq({ 'includePaymentChannel' => 'channel1,channel2' })
  end
end
