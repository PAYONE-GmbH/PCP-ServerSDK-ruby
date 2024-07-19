# PCPServerSDK::OrderLineDetailsResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier of a cart item | [optional] |
| **status** | [**Array&lt;CartItemOrderStatus&gt;**](CartItemOrderStatus.md) |  | [optional] |
| **product_code** | **String** | Product or UPC Code | [optional] |
| **product_price** | **Integer** | The price of one unit of the product, the value should be zero or greater. |  |
| **product_type** | [**ProductType**](ProductType.md) |  | [optional] |
| **quantity** | **Integer** | Quantity of the units being purchased, should be greater than zero Note: Must not be all spaces or all zeros |  |
| **tax_amount** | **Integer** | Tax on the line item, with the last two digits implied as decimal places | [optional] |
| **product_url** | **String** | URL of the product in shop.   Used for PAYONE Buy Now, Pay Later (BNPL). | [optional] |
| **product_image_url** | **String** | URL of a product image.   Used for PAYONE Buy Now, Pay Later (BNPL). | [optional] |
| **product_category_path** | **String** | Category path of the item.   Used for PAYONE Buy Now, Pay Later (BNPL). | [optional] |
| **merchant_shop_delivery_reference** | **String** | Optional parameter to define the delivery shop or touchpoint where an item has been collected (e.g. for Click &amp; Collect or Click &amp; Reserve). | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::OrderLineDetailsResult.new(
  id: 7a3444d3-f6ce-4b6e-b6c4-2486a160cf19,
  status: null,
  product_code: ASP01,
  product_price: 480,
  product_type: null,
  quantity: 1,
  tax_amount: 0,
  product_url: https://shop.url/watches/watch01,
  product_image_url: https://shop.url/watches/watch01.jpg,
  product_category_path: Watches &gt; Smartwatches,
  merchant_shop_delivery_reference: Store-12345
)
```

