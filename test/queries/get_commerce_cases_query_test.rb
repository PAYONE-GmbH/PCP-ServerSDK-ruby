require 'test_helper'
require_relative '../../lib/PCP-server-Ruby-SDK/queries/get_commerce_cases_query'

class TestGetCommerceCasesQuery < Minitest::Test
  def setup
    @query = GetCommerceCasesQuery.new
  end

  def test_initialize_sets_default_include_checkout_status
    assert_equal [], @query.include_checkout_status
  end

  def test_initialize_sets_default_include_payment_channel
    assert_equal [], @query.include_payment_channel
  end

  def test_set_offset
    @query.set_offset(10)
    assert_equal 10, @query.offset
  end

  def test_set_size
    @query.set_size(20)
    assert_equal 20, @query.size
  end

  def test_set_from_date
    @query.set_from_date('2023-01-01')
    assert_equal '2023-01-01', @query.from_date
  end

  def test_set_to_date
    @query.set_to_date('2023-12-31')
    assert_equal '2023-12-31', @query.to_date
  end

  def test_set_commerce_case_id
    @query.set_commerce_case_id('case_123')
    assert_equal 'case_123', @query.commerce_case_id
  end

  def test_set_merchant_reference
    @query.set_merchant_reference('ref_456')
    assert_equal 'ref_456', @query.merchant_reference
  end

  def test_set_merchant_customer_id
    @query.set_merchant_customer_id('cust_789')
    assert_equal 'cust_789', @query.merchant_customer_id
  end

  def test_set_include_checkout_status
    @query.set_include_checkout_status(['status1', 'status2'])
    assert_equal ['status1', 'status2'], @query.include_checkout_status
  end

  def test_set_include_payment_channel
    @query.set_include_payment_channel(['channel1', 'channel2'])
    assert_equal ['channel1', 'channel2'], @query.include_payment_channel
  end

  def test_to_query_map_with_offset
    @query.set_offset(10)
    assert_equal({ 'offset' => '10' }, @query.to_query_map)
  end

  def test_to_query_map_with_size
    @query.set_size(20)
    assert_equal({ 'size' => '20' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_date
    @query.set_from_date('2023-01-01')
    assert_equal({ 'fromDate' => '2023-01-01' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_date
    @query.set_to_date('2023-12-31')
    assert_equal({ 'toDate' => '2023-12-31' }, @query.to_query_map)
  end

  def test_to_query_map_with_commerce_case_id
    @query.set_commerce_case_id('case_123')
    assert_equal({ 'commerceCaseId' => 'case_123' }, @query.to_query_map)
  end

  def test_to_query_map_with_merchant_reference
    @query.set_merchant_reference('ref_456')
    assert_equal({ 'merchantReference' => 'ref_456' }, @query.to_query_map)
  end

  def test_to_query_map_with_merchant_customer_id
    @query.set_merchant_customer_id('cust_789')
    assert_equal({ 'merchantCustomerId' => 'cust_789' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_checkout_status
    @query.set_include_checkout_status(['status1', 'status2'])
    assert_equal({ 'includeCheckoutStatus' => 'status1,status2' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_payment_channel
    @query.set_include_payment_channel(['channel1', 'channel2'])
    assert_equal({ 'includePaymentChannel' => 'channel1,channel2' }, @query.to_query_map)
  end
end
