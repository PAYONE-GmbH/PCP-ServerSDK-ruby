# PCPServerSDK::CheckoutReferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_reference** | **String** | Unique reference of the Checkout that is also returned for reporting and reconciliation purposes. | [optional] |
| **merchant_shop_reference** | **String** | Optional parameter to define the shop or touchpoint where a sale has been realized (e.g. different stores). | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CheckoutReferences.new(
  merchant_reference: customer-order-1234,
  merchant_shop_reference: Shop-12345
)
```

