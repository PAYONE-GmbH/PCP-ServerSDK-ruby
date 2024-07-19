# PCPServerSDK::PaymentStatusOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_cancellable** | **Boolean** | Flag indicating if the payment can be cancelled | [optional] |
| **status_category** | [**StatusCategoryValue**](StatusCategoryValue.md) |  | [optional] |
| **is_authorized** | **Boolean** | Indicates if the transaction has been authorized | [optional] |
| **is_refundable** | **Boolean** | Flag indicating if the payment can be refunded | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentStatusOutput.new(
  is_cancellable: null,
  status_category: null,
  is_authorized: null,
  is_refundable: null
)
```

