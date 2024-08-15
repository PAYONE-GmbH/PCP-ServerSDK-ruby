require File.expand_path('../test_helper', __dir__)

require "date"
require "json"

class TestOrderLineDetailsResult < Minitest::Test
  def test_to_hash_and_from_hash_are_idempotent
    result = PCPServerSDK::Models::OrderLineDetailsResult.new
    result.product_code = 'identifier'
    result.product_price = 1299
    result.product_type = PCPServerSDK::ProductType::GOODS
    result.quantity = 2
    result.tax_amount = 19
    result.id = 'u1234'

    cartItemOrderStatus = PCPServerSDK::Models::CartItemOrderStatus.new
    result.status = []


    hash = result.to_hash
    restored_result = result.class.new_from_hash(hash)

    assert_equal result, restored_result
  end
end
