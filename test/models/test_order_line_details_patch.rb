require File.expand_path('../test_helper', __dir__)

require "date"
require "json"

class TestOrderLineDetailsPatch < Minitest::Test
  def test_json_representation_is_ok
    expected_json = '{"productCode":"code","productPrice":480,"productType":"GOODS","quantity":1,"taxAmount":19,"id":"product-id","status":[{}]}'

    patch = PCPServerSDK::Models::OrderLineDetailsPatch.new
    patch.product_code = 'code'
    patch.product_price = 480
    patch.product_type = PCPServerSDK::Models::ProductType::GOODS
    patch.quantity = 1
    patch.tax_amount = 19
    patch.id = 'product-id'

    cartItemOrderStatus = PCPServerSDK::Models::CartItemOrderStatus.new
    patch.status = [cartItemOrderStatus]

    
    actual_json = patch.to_hash.to_json


    assert_equal expected_json, actual_json
  end

  def test_to_hash_and_from_hash_are_idempotent
    patch = PCPServerSDK::Models::OrderLineDetailsPatch.new
    patch.product_code = 'code'
    patch.product_price = 480
    patch.product_type = PCPServerSDK::Models::ProductType::GOODS
    patch.quantity = 1
    patch.tax_amount = 19
    patch.id = 'product-id'

    cartItemOrderStatus = PCPServerSDK::Models::CartItemOrderStatus.new
    patch.status = [cartItemOrderStatus]


    hash = patch.to_hash
    restored_patch = patch.class.new_from_hash(hash)

    assert_equal patch, restored_patch
  end
end
