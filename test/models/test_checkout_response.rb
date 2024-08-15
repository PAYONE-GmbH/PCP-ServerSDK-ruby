require File.expand_path('../test_helper', __dir__)

require "date"
require "json"

class TestCheckoutResponse < Minitest::Test
  def test_json_represenation_is_ok
    expected_json = '{"commerceCaseId":"com1","checkoutId":"che1","merchantCustomerId":"mer1","amountOfMoney":{"amount":1299,"currencyCode":"EUR"},"creationDateTime":"2021-07-01T12:00:00+00:00","allowedPaymentActions":["ORDER_MANAGEMENT","PAYMENT_EXECUTION"]}'

    response = PCPServerSDK::Models::CheckoutResponse.new
    response.commerce_case_id = "com1"
    response.checkout_id = "che1"
    response.merchant_customer_id = "mer1"

    amount_of_money = PCPServerSDK::Models::AmountOfMoney.new
    amount_of_money.amount = 1299
    amount_of_money.currency_code = "EUR"
    response.amount_of_money = amount_of_money

    response.creation_date_time = DateTime.rfc3339("2021-07-01T12:00:00Z")
    allowed_payment_actions = [
      PCPServerSDK::Models::AllowedPaymentActions::ORDER_MANAGEMENT,
      PCPServerSDK::Models::AllowedPaymentActions::PAYMENT_EXECUTION
    ]
    response.allowed_payment_actions = allowed_payment_actions
    puts "creation: #{response.creation_date_time} is #{response.creation_date_time.nil?}"


    actual_json = response.to_hash.to_json


    assert_equal expected_json, actual_json
  end
end
