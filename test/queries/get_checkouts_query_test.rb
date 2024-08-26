require 'test_helper'

require_relative '../../lib/PCP-server-Ruby-SDK/queries/get_checkouts_query'

class TestGetCheckoutsQuery < Minitest::Test
  def setup
    @query = GetCheckoutsQuery.new
  end

  def test_initialize_sets_default_include_payment_product_id
    assert_equal [], @query.include_payment_product_id
  end

  def test_initialize_sets_default_include_checkout_status
    assert_equal [], @query.include_checkout_status
  end

  def test_initialize_sets_default_include_extended_checkout_status
    assert_equal [], @query.include_extended_checkout_status
  end

  def test_initialize_sets_default_include_payment_channel
    assert_equal [], @query.include_payment_channel
  end

  def test_to_query_map_with_offset
    @query.offset = 10
    assert_equal({ 'offset' => '10' }, @query.to_query_map)
  end

  def test_to_query_map_with_size
    @query.size = 20
    assert_equal({ 'size' => '20' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_date
    @query.from_date = '2023-01-01'
    assert_equal({ 'fromDate' => '2023-01-01' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_date
    @query.to_date = '2023-12-31'
    assert_equal({ 'toDate' => '2023-12-31' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_checkout_amount
    @query.from_checkout_amount = 100
    assert_equal({ 'fromCheckoutAmount' => '100' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_checkout_amount
    @query.to_checkout_amount = 200
    assert_equal({ 'toCheckoutAmount' => '200' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_open_amount
    @query.from_open_amount = 50
    assert_equal({ 'fromOpenAmount' => '50' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_open_amount
    @query.to_open_amount = 150
    assert_equal({ 'toOpenAmount' => '150' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_collected_amount
    @query.from_collected_amount = 75
    assert_equal({ 'fromCollectedAmount' => '75' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_collected_amount
    @query.to_collected_amount = 175
    assert_equal({ 'toCollectedAmount' => '175' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_cancelled_amount
    @query.from_cancelled_amount = 25
    assert_equal({ 'fromCancelledAmount' => '25' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_cancelled_amount
    @query.to_cancelled_amount = 125
    assert_equal({ 'toCancelledAmount' => '125' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_refund_amount
    @query.from_refund_amount = 30
    assert_equal({ 'fromRefundAmount' => '30' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_refund_amount
    @query.to_refund_amount = 130
    assert_equal({ 'toRefundAmount' => '130' }, @query.to_query_map)
  end

  def test_to_query_map_with_from_chargeback_amount
    @query.from_chargeback_amount = 40
    assert_equal({ 'fromChargebackAmount' => '40' }, @query.to_query_map)
  end

  def test_to_query_map_with_to_chargeback_amount
    @query.to_chargeback_amount = 140
    assert_equal({ 'toChargebackAmount' => '140' }, @query.to_query_map)
  end

  def test_to_query_map_with_checkout_id
    @query.checkout_id = 'chk_123'
    assert_equal({ 'checkoutId' => 'chk_123' }, @query.to_query_map)
  end

  def test_to_query_map_with_merchant_reference
    @query.merchant_reference = 'ref_456'
    assert_equal({ 'merchantReference' => 'ref_456' }, @query.to_query_map)
  end

  def test_to_query_map_with_merchant_customer_id
    @query.merchant_customer_id = 'cust_789'
    assert_equal({ 'merchantCustomerId' => 'cust_789' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_payment_product_id
    @query.include_payment_product_id = [1, 2, 3]
    assert_equal({ 'includePaymentProductId' => '1,2,3' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_checkout_status
    @query.include_checkout_status = ['status1', 'status2']
    assert_equal({ 'includeCheckoutStatus' => 'status1,status2' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_extended_checkout_status
    @query.include_extended_checkout_status = ['ext_status1', 'ext_status2']
    assert_equal({ 'includeExtendedCheckoutStatus' => 'ext_status1,ext_status2' }, @query.to_query_map)
  end

  def test_to_query_map_with_include_payment_channel
    @query.include_payment_channel = ['channel1', 'channel2']
    assert_equal({ 'includePaymentChannel' => 'channel1,channel2' }, @query.to_query_map)
  end

  def test_to_query_map_with_payment_reference
    @query.payment_reference = 'pay_ref_123'
    assert_equal({ 'paymentReference' => 'pay_ref_123' }, @query.to_query_map)
  end

  def test_to_query_map_with_payment_id
    @query.payment_id = 'pay_id_456'
    assert_equal({ 'paymentId' => 'pay_id_456' }, @query.to_query_map)
  end

  def test_to_query_map_with_first_name
    @query.first_name = 'John'
    assert_equal({ 'firstName' => 'John' }, @query.to_query_map)
  end

  def test_to_query_map_with_surname
    @query.surname = 'Doe'
    assert_equal({ 'surname' => 'Doe' }, @query.to_query_map)
  end

  def test_to_query_map_with_email
    @query.email = 'john.doe@example.com'
    assert_equal({ 'email' => 'john.doe@example.com' }, @query.to_query_map)
  end

  def test_to_query_map_with_phone_number
    @query.phone_number = '1234567890'
    assert_equal({ 'phoneNumber' => '1234567890' }, @query.to_query_map)
  end

  def test_to_query_map_with_date_of_birth
    @query.date_of_birth = '1980-01-01'
    assert_equal({ 'dateOfBirth' => '1980-01-01' }, @query.to_query_map)
  end

  def test_to_query_map_with_company_information
    @query.company_information = 'Company XYZ'
    assert_equal({ 'companyInformation' => 'Company XYZ' }, @query.to_query_map)
  end
end
