# PCPServerSDK::CartItemInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_data** | [**CartItemInvoiceData**](CartItemInvoiceData.md) |  | [optional] |
| **order_line_details** | [**OrderLineDetailsInput**](OrderLineDetailsInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CartItemInput.new(
  invoice_data: null,
  order_line_details: null
)
```

